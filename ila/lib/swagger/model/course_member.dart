part of swagger.api;

class CourseMember {
  
  Course course = null;
  

  int courseId = null;
  

  ILAUser member = null;
  

  String memberId = null;
  
  CourseMember();

  @override
  String toString() {
    return 'CourseMember[course=$course, courseId=$courseId, member=$member, memberId=$memberId, ]';
  }

  CourseMember.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    course =
      
      
      new Course.fromJson(json['course'])
;
    courseId =
        json['courseId']
    ;
    member =
      
      
      new ILAUser.fromJson(json['member'])
;
    memberId =
        json['memberId']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'course': course,
      'courseId': courseId,
      'member': member,
      'memberId': memberId
     };
  }

  static List<CourseMember> listFromJson(List<dynamic> json) {
    return json == null ? new List<CourseMember>() : json.map((value) => new CourseMember.fromJson(value)).toList();
  }

  static Map<String, CourseMember> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, CourseMember>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new CourseMember.fromJson(value));
    }
    return map;
  }
}

