part of swagger.api;

class CourseModel {
  
  int id = null;
  

  String title = null;
  

  String description = null;
  

  int ownerId = null;
  

  List<TokenModel> courseTokens = [];
  

  List<MemberModel> members = [];
  
  CourseModel();

  @override
  String toString() {
    return 'CourseModel[id=$id, title=$title, description=$description, ownerId=$ownerId, courseTokens=$courseTokens, members=$members, ]';
  }

  CourseModel.fromJson(Map<String, dynamic> json) {
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
    ownerId =
        json['ownerId']
    ;
    courseTokens =
      TokenModel.listFromJson(json['courseTokens'])
;
    members =
      MemberModel.listFromJson(json['members'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'ownerId': ownerId,
      'courseTokens': courseTokens,
      'members': members
     };
  }

  static List<CourseModel> listFromJson(List<dynamic> json) {
    return json == null ? new List<CourseModel>() : json.map((value) => new CourseModel.fromJson(value)).toList();
  }

  static Map<String, CourseModel> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, CourseModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CourseModel.fromJson(value));
    }
    return map;
  }
}

