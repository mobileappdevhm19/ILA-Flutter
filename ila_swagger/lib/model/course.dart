part of ila_swagger.api;

class Course {
  
  int id = null;
  

  String title = null;
  

  String description = null;
  

  bool archived = null;
  

  ILAUser owner = null;
  

  List<CourseMember> members = [];
  

  List<Lecture> lectures = [];
  

  List<CourseToken> tokens = [];
  

  List<CourseNews> news = [];
  
  Course();

  @override
  String toString() {
    return 'Course[id=$id, title=$title, description=$description, archived=$archived, owner=$owner, members=$members, lectures=$lectures, tokens=$tokens, news=$news, ]';
  }

  Course.fromJson(Map<String, dynamic> json) {
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
    archived =
        json['archived']
    ;
    owner =
      
      
      new ILAUser.fromJson(json['owner'])
;
    members =
      CourseMember.listFromJson(json['members'])
;
    lectures =
      Lecture.listFromJson(json['lectures'])
;
    tokens =
      CourseToken.listFromJson(json['tokens'])
;
    news =
      CourseNews.listFromJson(json['news'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'archived': archived,
      'owner': owner,
      'members': members,
      'lectures': lectures,
      'tokens': tokens,
      'news': news
     };
  }

  static List<Course> listFromJson(List<dynamic> json) {
    return json == null ? new List<Course>() : json.map((value) => new Course.fromJson(value)).toList();
  }

  static Map<String, Course> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Course>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Course.fromJson(value));
    }
    return map;
  }
}

