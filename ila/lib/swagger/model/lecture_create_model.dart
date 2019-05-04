part of swagger.api;

class LectureCreateModel {
  
  String topic = null;
  

  String description = null;
  

  bool visible = null;
  

  int courseId = null;
  
  LectureCreateModel();

  @override
  String toString() {
    return 'LectureCreateModel[topic=$topic, description=$description, visible=$visible, courseId=$courseId, ]';
  }

  LectureCreateModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    topic =
        json['topic']
    ;
    description =
        json['description']
    ;
    visible =
        json['visible']
    ;
    courseId =
        json['courseId']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'topic': topic,
      'description': description,
      'visible': visible,
      'courseId': courseId
     };
  }

  static List<LectureCreateModel> listFromJson(List<dynamic> json) {
    return json == null ? new List<LectureCreateModel>() : json.map((value) => new LectureCreateModel.fromJson(value)).toList();
  }

  static Map<String, LectureCreateModel> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, LectureCreateModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new LectureCreateModel.fromJson(value));
    }
    return map;
  }
}

