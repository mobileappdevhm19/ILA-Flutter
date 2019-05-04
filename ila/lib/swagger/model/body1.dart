part of swagger.api;

class Body1 {
  
  int courseId = null;
  

  String token = null;
  
  Body1();

  @override
  String toString() {
    return 'Body1[courseId=$courseId, token=$token, ]';
  }

  Body1.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    courseId =
        json['courseId']
    ;
    token =
        json['token']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'courseId': courseId,
      'token': token
     };
  }

  static List<Body1> listFromJson(List<dynamic> json) {
    return json == null ? new List<Body1>() : json.map((value) => new Body1.fromJson(value)).toList();
  }

  static Map<String, Body1> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Body1>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Body1.fromJson(value));
    }
    return map;
  }
}

