part of swagger.api;

class LectureCreateUpdateModel {
  
  String title = null;
  

  String description = null;
  

  bool visible = null;
  

  DateTime start = null;
  

  DateTime stop = null;
  
  LectureCreateUpdateModel();

  @override
  String toString() {
    return 'LectureCreateUpdateModel[title=$title, description=$description, visible=$visible, start=$start, stop=$stop, ]';
  }

  LectureCreateUpdateModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    title =
        json['title']
    ;
    description =
        json['description']
    ;
    visible =
        json['visible']
    ;
    start = json['start'] == null ? null : DateTime.parse(json['start']);
    stop = json['stop'] == null ? null : DateTime.parse(json['stop']);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'visible': visible,
      'start': start == null ? '' : start.toUtc().toIso8601String(),
      'stop': stop == null ? '' : stop.toUtc().toIso8601String()
     };
  }

  static List<LectureCreateUpdateModel> listFromJson(List<dynamic> json) {
    return json == null ? new List<LectureCreateUpdateModel>() : json.map((value) => new LectureCreateUpdateModel.fromJson(value)).toList();
  }

  static Map<String, LectureCreateUpdateModel> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, LectureCreateUpdateModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new LectureCreateUpdateModel.fromJson(value));
    }
    return map;
  }
}

