part of swagger.api;

class CoursesResponseModel {
  
  List<CourseModel> ownCourses = [];
  

  List<CourseModel> memberCourses = [];
  
  CoursesResponseModel();

  @override
  String toString() {
    return 'CoursesResponseModel[ownCourses=$ownCourses, memberCourses=$memberCourses, ]';
  }

  CoursesResponseModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    ownCourses =
      CourseModel.listFromJson(json['ownCourses'])
;
    memberCourses =
      CourseModel.listFromJson(json['memberCourses'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'ownCourses': ownCourses,
      'memberCourses': memberCourses
     };
  }

  static List<CoursesResponseModel> listFromJson(List<dynamic> json) {
    return json == null ? new List<CoursesResponseModel>() : json.map((value) => new CoursesResponseModel.fromJson(value)).toList();
  }

  static Map<String, CoursesResponseModel> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, CoursesResponseModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CoursesResponseModel.fromJson(value));
    }
    return map;
  }
}

