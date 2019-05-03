part of swagger.api;

class LectureModel {
  
  int id = null;
  

  String topic = null;
  

  String description = null;
  

  bool visible = null;
  

  int courseId = null;
  
  LectureModel();

  @override
  String toString() {
    return 'LectureModel[id=$id, topic=$topic, description=$description, visible=$visible, courseId=$courseId, ]';
  }

  LectureModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
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
      'id': id,
      'topic': topic,
      'description': description,
      'visible': visible,
      'courseId': courseId
     };
  }

  static List<LectureModel> listFromJson(List<dynamic> json) {
    return json == null ? new List<LectureModel>() : json.map((value) => new LectureModel.fromJson(value)).toList();
  }

  static Map<String, LectureModel> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, LectureModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new LectureModel.fromJson(value));
    }
    return map;
  }
}

