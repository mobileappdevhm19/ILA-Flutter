part of swagger.api;

class AuthLoginResponse {
  
  String token = null;
  
  AuthLoginResponse();

  @override
  String toString() {
    return 'AuthLoginResponse[token=$token, ]';
  }

  AuthLoginResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    token =
        json['token']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token
     };
  }

  static List<AuthLoginResponse> listFromJson(List<dynamic> json) {
    return json == null ? new List<AuthLoginResponse>() : json.map((value) => new AuthLoginResponse.fromJson(value)).toList();
  }

  static Map<String, AuthLoginResponse> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, AuthLoginResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new AuthLoginResponse.fromJson(value));
    }
    return map;
  }
}

