part of ila_swagger.api;

class QueryParam {
  String name;
  String value;

  QueryParam(this.name, this.value);
}

class ApiClient {
  String token;
  String username;
  String password;
  JWT jwt;

  AuthStatus _status = AuthStatus.None;

  AuthStatus getStatus() => _status;

  String basePath;
  var client = new Client();

  Map<String, String> _defaultHeaderMap = {};
  Map<String, Authentication> _authentications = {};

  final _RegList = new RegExp(r'^List<(.*)>$');
  final _RegMap = new RegExp(r'^Map<String,(.*)>$');

  ApiClient({this.basePath: "https://ila.dev.kirschbaum.bayern"}) {
    _authentications['JWT'] = new ApiKeyAuth("header", "Authorization", "Bearer");
  }

  void addDefaultHeader(String key, String value) {
    _defaultHeaderMap[key] = value;
  }

  dynamic _deserialize(dynamic value, String targetType) {
    try {
      switch (targetType) {
        case 'String':
          return '$value';
        case 'int':
          return value is int ? value : int.parse('$value');
        case 'bool':
          return value is bool ? value : '$value'.toLowerCase() == 'true';
        case 'double':
          return value is double ? value : double.parse('$value');
        case 'Answer':
          return new Answer.fromJson(value);
        case 'Course':
          return new Course.fromJson(value);
        case 'CourseCreateUpateModel':
          return new CourseCreateUpateModel.fromJson(value);
        case 'CourseMember':
          return new CourseMember.fromJson(value);
        case 'CourseToken':
          return new CourseToken.fromJson(value);
        case 'IdentityUserOfString':
          return new IdentityUserOfString.fromJson(value);
        case 'JsonWebToken':
          return new JsonWebToken.fromJson(value);
        case 'Lecture':
          return new Lecture.fromJson(value);
        case 'LectureCreateUpdateModel':
          return new LectureCreateUpdateModel.fromJson(value);
        case 'Pause':
          return new Pause.fromJson(value);
        case 'Question':
          return new Question.fromJson(value);
        case 'QuestionCreate':
          return new QuestionCreate.fromJson(value);
        case 'SignIn':
          return new SignIn.fromJson(value);
        case 'SignUp':
          return new SignUp.fromJson(value);
        case 'IdentityUser':
          return new IdentityUser.fromJson(value);
        case 'ILAUser':
          return new ILAUser.fromJson(value);
        default:
          {
            Match match;
            if (value is List &&
                (match = _RegList.firstMatch(targetType)) != null) {
              var newTargetType = match[1];
              return value.map((v) => _deserialize(v, newTargetType)).toList();
            } else if (value is Map &&
                (match = _RegMap.firstMatch(targetType)) != null) {
              var newTargetType = match[1];
              return new Map.fromIterables(value.keys,
                  value.values.map((v) => _deserialize(v, newTargetType)));
            }
          }
      }
    } catch (e, stack) {
      throw new ApiException.withInner(
          500, 'Exception during deserialization.', e, stack);
    }
    throw new ApiException(
        500, 'Could not find a suitable class for deserialization');
  }

  dynamic deserialize(String jsonVal, String targetType) {
    // Remove all spaces.  Necessary for reg expressions as well.
    targetType = targetType.replaceAll(' ', '');

    if (targetType == 'String') return jsonVal;

    var decodedJson = json.decode(jsonVal);
    return _deserialize(decodedJson, targetType);
  }

  String serialize(Object obj) {
    String serialized = '';
    if (obj == null) {
      serialized = '';
    } else {
      serialized = json.encode(obj);
    }
    return serialized;
  }

  // We don't use a Map<String, String> for queryParams.
  // If collectionFormat is 'multi' a key might appear multiple times.
  Future<Response> invokeAPI(String path,
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
        print('update JWT');
        try {
          await login(username, password);
        } catch(error){
          // TODO: redirect to login
        }
        print('JWT updated');
      }
    }

    _updateParamsForAuth(authNames, queryParams, headerParams);

    var ps = queryParams.where((p) => p.value != null).map((p) => '${p.name}=${p
        .value}');
    String queryString = ps.isNotEmpty ?
    '?' + ps.join('&') :
    '';

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

  /// Update query and header parameters based on authentication settings.
  /// @param authNames The authentications to apply
  void _updateParamsForAuth(List<String> authNames,
      List<QueryParam> queryParams, Map<String, String> headerParams) {
    authNames.forEach((authName) {
      Authentication auth = _authentications[authName];
      if (auth == null) throw new ArgumentError(
          "Authentication undefined: " + authName);
      auth.applyToParams(queryParams, headerParams);
    });
  }

  void setAccessToken(String accessToken) {
    _authentications.forEach((key, auth) {
      if (auth is ApiKeyAuth) {
        auth.apiKey = accessToken;
      }
    });
  }

  Future login(String username, String password) async {
    _status = AuthStatus.Login;
    try {
      var response = await AccountApi().accountSignIn(
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

  logout() async {
    try {
      await AccountApi().accountLogout();
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
