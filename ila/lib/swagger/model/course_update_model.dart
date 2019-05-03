part of swagger.api;

class CourseUpdateModel {
  
  int id = null;
  

  String title = null;
  

  String description = null;
  
  CourseUpdateModel();

  @override
  String toString() {
    return 'CourseUpdateModel[id=$id, title=$title, description=$description, ]';
  }

  CourseUpdateModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    title =
        json['title']
    ;
    description =
        json['description']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description
     };
  }

  static List<CourseUpdateModel> listFromJson(List<dynamic> json) {
    return json == null ? new List<CourseUpdateModel>() : json.map((value) => new CourseUpdateModel.fromJson(value)).toList();
  }

  static Map<String, CourseUpdateModel> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, CourseUpdateModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CourseUpdateModel.fromJson(value));
    }
    return map;
  }
}

