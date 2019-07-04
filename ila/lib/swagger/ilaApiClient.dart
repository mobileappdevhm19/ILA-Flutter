import 'package:http/http.dart';
import 'package:ila/helpers/routes.dart';
import 'package:ila/helpers/userException.dart';
import 'package:ila_swagger/api.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'dart:convert';

class IlaApiClient extends ApiClient {
  String token;
  String username;
  String password;
  JWT jwt;

  Map<String, String> _defaultHeaderMap = {};
  Map<String, Authentication> _authentication = {};
  AuthStatus _status = AuthStatus.None;

  AuthStatus getStatus() => _status;

  IlaApiClient() {
    ApiKeyAuth auth = new ApiKeyAuth("header", "Authorization");
    auth.apiKeyPrefix = "Bearer";
    _authentication['JWT'] = auth;
  }

  @override
  Future<Response> invokeAPI(
      String path,
      String method,
      Iterable<QueryParam> queryParams,
      Object body,
      Map<String, String> headerParams,
      Map<String, String> formParams,
      String contentType,
      List<String> authNames) async {
    if (authNames.length != 0) {
      // token renewal
      if (jwt != null &&
          jwt.expiresAt
              .subtract(Duration(seconds: 30))
              .difference(DateTime.now().toUtc())
              .isNegative) {
        try {
          await login(username, password);
        } catch (error) {
          // TODO: redirect to login
        }
      }
    }

    _updateParamsForAuth(authNames, queryParams, headerParams);

    var ps = queryParams
        .where((p) => p.value != null)
        .map((p) => '${p.name}=${p.value}');
    String queryString = ps.isNotEmpty ? '?' + ps.join('&') : '';

    String url = basePath + path + queryString;

    headerParams.addAll(_defaultHeaderMap);
    headerParams['Content-Type'] = contentType;

    if (body is MultipartRequest) {
      var request = new MultipartRequest(method, Uri.parse(url));
      request.fields.addAll(body.fields);
      request.files.addAll(body.files);
      request.headers.addAll(body.headers);
      request.headers.addAll(headerParams);
      var response = await client.send(request);
      return Response.fromStream(response);
    } else {
      var msgBody = contentType == "application/x-www-form-urlencoded"
          ? formParams
          : serialize(body);
      switch (method) {
        case "POST":
          return client.post(url, headers: headerParams, body: msgBody);
        case "PUT":
          return client.put(url, headers: headerParams, body: msgBody);
        case "DELETE":
          return client.delete(url, headers: headerParams);
        case "PATCH":
          return client.patch(url, headers: headerParams, body: msgBody);
        default:
          return client.get(url, headers: headerParams);
      }
    }
  }

  @override
  void _updateParamsForAuth(List<String> authNames,
      List<QueryParam> queryParams, Map<String, String> headerParams) {
    authNames.forEach((authName) {
      Authentication auth = _authentication[authName];
      if (auth == null)
        throw new ArgumentError("Authentication undefined: " + authName);
      auth.applyToParams(queryParams, headerParams);
    });
  }

  @override
  void setAccessToken(String accessToken) {
    _authentication.forEach((key, auth) {
      if (auth is ApiKeyAuth) {
        auth.apiKey = accessToken;
      }
    });
  }

  Future login(String username, String password) async {
    _status = AuthStatus.Login;
    try {
      var response = await (accountApi ?? AccountApi()).accountSignIn(
          SignIn.fromJson({'username': username, 'password': password}));

      final decoded =
          B64urlEncRfc7515.decodeUtf8(response.accessToken.split('.')[1]);
      jwt = JWT.fromJsonString(jsonDecode(decoded));
      token = response.accessToken;

      this.username = username;
      this.password = password;
      defaultApiClient.setAccessToken(token);

      _status = AuthStatus.LoggedIn;
    } catch (error) {
      _status = AuthStatus.LoginFailed;

      this.username = null;
      this.password = null;
      jwt = null;
      this.setAccessToken(null);

      if (error is ApiException) {
        throw UserException(message: error.message);
      } else {
        throw UserException(message: 'Undefined Error occured');
      }
    }
  }

  Future logout() async {
    try {
      await (accountApi ?? AccountApi()).accountLogout();
      username = null;
      password = null;
      jwt = null;
      _status = AuthStatus.None;
      token = null;
      setAccessToken(null);
    } catch (error) {
      if (error is ApiException) {
        throw UserException(message: error.message);
      } else {
        throw UserException(message: 'Undefined Error occured');
      }
    }
  }
}

class JWT {
  int id;
  int iat;
  int exp;
  String sub;
  String aud;
  String iss;
  DateTime expiresAt;

  JWT.fromJsonString(Map<String, dynamic> json)
      : id = json['id'],
        iat = json['iat'],
        exp = json['exp'],
        sub = json['sub'],
        aud = json['aud'],
        iss = json['iss'] {
    expiresAt = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
  }
}

enum AuthStatus {
  None,
  Login,
  LoggedIn,
  LoginFailed,
  // Expired,
}
