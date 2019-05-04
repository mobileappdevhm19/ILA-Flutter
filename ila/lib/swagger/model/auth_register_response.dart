part of swagger.api;

class AuthRegisterResponse {
  
  List<String> messages = [];
  
  AuthRegisterResponse();

  @override
  String toString() {
    return 'AuthRegisterResponse[messages=$messages, ]';
  }

  AuthRegisterResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    messages =
        (json['messages'] as List).map((item) => item as String).toList()
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'messages': messages
     };
  }

  static List<AuthRegisterResponse> listFromJson(List<dynamic> json) {
    return json == null ? new List<AuthRegisterResponse>() : json.map((value) => new AuthRegisterResponse.fromJson(value)).toList();
  }

  static Map<String, AuthRegisterResponse> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, AuthRegisterResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new AuthRegisterResponse.fromJson(value));
    }
    return map;
  }
}

