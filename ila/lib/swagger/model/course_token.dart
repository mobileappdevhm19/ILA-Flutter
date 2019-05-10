part of swagger.api;

class CourseToken {
  
  int id = null;
  

  String token = null;
  

  bool active = null;
  

  Course course = null;
  
  CourseToken();

  @override
  String toString() {
    return 'CourseToken[id=$id, token=$token, active=$active, course=$course, ]';
  }

  CourseToken.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    token =
        json['token']
    ;
    active =
        json['active']
    ;
    course =
      
      
      new Course.fromJson(json['course'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'token': token,
      'active': active,
      'course': course
     };
  }

  static List<CourseToken> listFromJson(List<dynamic> json) {
    return json == null ? new List<CourseToken>() : json.map((value) => new CourseToken.fromJson(value)).toList();
  }

  static Map<String, CourseToken> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, CourseToken>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CourseToken.fromJson(value));
    }
    return map;
  }
}

