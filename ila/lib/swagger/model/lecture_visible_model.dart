part of swagger.api;

class LectureVisibleModel {
  
  int id = null;
  

  bool visible = null;
  
  LectureVisibleModel();

  @override
  String toString() {
    return 'LectureVisibleModel[id=$id, visible=$visible, ]';
  }

  LectureVisibleModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    visible =
        json['visible']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'visible': visible
     };
  }

  static List<LectureVisibleModel> listFromJson(List<dynamic> json) {
    return json == null ? new List<LectureVisibleModel>() : json.map((value) => new LectureVisibleModel.fromJson(value)).toList();
  }

  static Map<String, LectureVisibleModel> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, LectureVisibleModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new LectureVisibleModel.fromJson(value));
    }
    return map;
  }
}

