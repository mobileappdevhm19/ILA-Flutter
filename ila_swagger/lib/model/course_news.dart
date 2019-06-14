part of ila_swagger.api;

class CourseNews {
  
  int id = null;
  

  String title = null;
  

  String body = null;
  

  Course course = null;
  
  CourseNews();

  @override
  String toString() {
    return 'CourseNews[id=$id, title=$title, body=$body, course=$course, ]';
  }

  CourseNews.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    title =
        json['title']
    ;
    body =
        json['body']
    ;
    course =
      
      
      new Course.fromJson(json['course'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'course': course
     };
  }

  static List<CourseNews> listFromJson(List<dynamic> json) {
    return json == null ? new List<CourseNews>() : json.map((value) => new CourseNews.fromJson(value)).toList();
  }

  static Map<String, CourseNews> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, CourseNews>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CourseNews.fromJson(value));
    }
    return map;
  }
}

