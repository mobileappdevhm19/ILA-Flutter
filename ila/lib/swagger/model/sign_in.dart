part of swagger.api;

class SignIn {
  
  String username = null;
  

  String password = null;
  
  SignIn();

  @override
  String toString() {
    return 'SignIn[username=$username, password=$password, ]';
  }

  SignIn.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    username =
        json['username']
    ;
    password =
        json['password']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password
     };
  }

  static List<SignIn> listFromJson(List<dynamic> json) {
    return json == null ? new List<SignIn>() : json.map((value) => new SignIn.fromJson(value)).toList();
  }

  static Map<String, SignIn> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, SignIn>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new SignIn.fromJson(value));
    }
    return map;
  }
}

