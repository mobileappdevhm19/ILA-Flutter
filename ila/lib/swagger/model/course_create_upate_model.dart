part of swagger.api;

class CourseCreateUpateModel {
  
  String title = null;
  

  String description = null;
  

  bool archived = null;
  
  CourseCreateUpateModel();

  @override
  String toString() {
    return 'CourseCreateUpateModel[title=$title, description=$description, archived=$archived, ]';
  }

  CourseCreateUpateModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    title =
        json['title']
    ;
    description =
        json['description']
    ;
    archived =
        json['archived']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'archived': archived
     };
  }

  static List<CourseCreateUpateModel> listFromJson(List<dynamic> json) {
    return json == null ? new List<CourseCreateUpateModel>() : json.map((value) => new CourseCreateUpateModel.fromJson(value)).toList();
  }

  static Map<String, CourseCreateUpateModel> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, CourseCreateUpateModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CourseCreateUpateModel.fromJson(value));
    }
    return map;
  }
}

