part of ila_swagger.api;

class JsonWebToken {
  
  String accessToken = null;
  

  int expires = null;
  
  JsonWebToken();

  @override
  String toString() {
    return 'JsonWebToken[accessToken=$accessToken, expires=$expires, ]';
  }

  JsonWebToken.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    accessToken =
        json['accessToken']
    ;
    expires =
        json['expires']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'expires': expires
     };
  }

  static List<JsonWebToken> listFromJson(List<dynamic> json) {
    return json == null ? new List<JsonWebToken>() : json.map((value) => new JsonWebToken.fromJson(value)).toList();
  }

  static Map<String, JsonWebToken> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, JsonWebToken>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new JsonWebToken.fromJson(value));
    }
    return map;
  }
}

