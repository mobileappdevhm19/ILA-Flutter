part of swagger.api;

class TokenModel {
  
  int id = null;
  

  String token = null;
  

  bool enabled = null;
  

  int courseId = null;
  
  TokenModel();

  @override
  String toString() {
    return 'TokenModel[id=$id, token=$token, enabled=$enabled, courseId=$courseId, ]';
  }

  TokenModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    token =
        json['token']
    ;
    enabled =
        json['enabled']
    ;
    courseId =
        json['courseId']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'token': token,
      'enabled': enabled,
      'courseId': courseId
     };
  }

  static List<TokenModel> listFromJson(List<dynamic> json) {
    return json == null ? new List<TokenModel>() : json.map((value) => new TokenModel.fromJson(value)).toList();
  }

  static Map<String, TokenModel> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, TokenModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new TokenModel.fromJson(value));
    }
    return map;
  }
}

