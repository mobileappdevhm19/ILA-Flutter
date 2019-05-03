part of swagger.api;

class CourseCreateModel {
  
  String title = null;
  

  String description = null;
  
  CourseCreateModel();

  @override
  String toString() {
    return 'CourseCreateModel[title=$title, description=$description, ]';
  }

  CourseCreateModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    title =
        json['title']
    ;
    description =
        json['description']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description
     };
  }

  static List<CourseCreateModel> listFromJson(List<dynamic> json) {
    return json == null ? new List<CourseCreateModel>() : json.map((value) => new CourseCreateModel.fromJson(value)).toList();
  }

  static Map<String, CourseCreateModel> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, CourseCreateModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CourseCreateModel.fromJson(value));
    }
    return map;
  }
}

