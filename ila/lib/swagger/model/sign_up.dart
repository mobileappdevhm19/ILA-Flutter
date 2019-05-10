part of swagger.api;

class SignUp {
  
  String username = null;
  

  String password = null;
  

  String firstName = null;
  

  String lastName = null;
  
  SignUp();

  @override
  String toString() {
    return 'SignUp[username=$username, password=$password, firstName=$firstName, lastName=$lastName, ]';
  }

  SignUp.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    username =
        json['username']
    ;
    password =
        json['password']
    ;
    firstName =
        json['firstName']
    ;
    lastName =
        json['lastName']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'firstName': firstName,
      'lastName': lastName
     };
  }

  static List<SignUp> listFromJson(List<dynamic> json) {
    return json == null ? new List<SignUp>() : json.map((value) => new SignUp.fromJson(value)).toList();
  }

  static Map<String, SignUp> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, SignUp>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new SignUp.fromJson(value));
    }
    return map;
  }
}

