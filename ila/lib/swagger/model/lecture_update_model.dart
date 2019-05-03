part of swagger.api;

class LectureUpdateModel {
  
  int id = null;
  

  String title = null;
  

  String description = null;
  
  LectureUpdateModel();

  @override
  String toString() {
    return 'LectureUpdateModel[id=$id, title=$title, description=$description, ]';
  }

  LectureUpdateModel.fromJson(Map<String, dynamic> json) {
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

  static List<LectureUpdateModel> listFromJson(List<dynamic> json) {
    return json == null ? new List<LectureUpdateModel>() : json.map((value) => new LectureUpdateModel.fromJson(value)).toList();
  }

  static Map<String, LectureUpdateModel> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, LectureUpdateModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new LectureUpdateModel.fromJson(value));
    }
    return map;
  }
}

