part of swagger.api;

class AuthLoginModel {
  
  String email = null;
  

  String password = null;
  
  AuthLoginModel();

  @override
  String toString() {
    return 'AuthLoginModel[email=$email, password=$password, ]';
  }

  AuthLoginModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    email =
        json['email']
    ;
    password =
        json['password']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password
     };
  }

  static List<AuthLoginModel> listFromJson(List<dynamic> json) {
    return json == null ? new List<AuthLoginModel>() : json.map((value) => new AuthLoginModel.fromJson(value)).toList();
  }

  static Map<String, AuthLoginModel> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, AuthLoginModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new AuthLoginModel.fromJson(value));
    }
    return map;
  }
}

