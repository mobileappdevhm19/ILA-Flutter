part of swagger.api;

class AuthRegisterModel {
  
  String email = null;
  

  String password = null;
  

  String name = null;
  
  AuthRegisterModel();

  @override
  String toString() {
    return 'AuthRegisterModel[email=$email, password=$password, name=$name, ]';
  }

  AuthRegisterModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    email =
        json['email']
    ;
    password =
        json['password']
    ;
    name =
        json['name']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'name': name
     };
  }

  static List<AuthRegisterModel> listFromJson(List<dynamic> json) {
    return json == null ? new List<AuthRegisterModel>() : json.map((value) => new AuthRegisterModel.fromJson(value)).toList();
  }

  static Map<String, AuthRegisterModel> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, AuthRegisterModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new AuthRegisterModel.fromJson(value));
    }
    return map;
  }
}

