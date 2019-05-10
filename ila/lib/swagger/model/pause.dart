part of swagger.api;

class Pause {
  
  int id = null;
  

  DateTime timeStamp = null;
  

  Lecture lecture = null;
  

  ILAUser user = null;
  
  Pause();

  @override
  String toString() {
    return 'Pause[id=$id, timeStamp=$timeStamp, lecture=$lecture, user=$user, ]';
  }

  Pause.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    timeStamp = json['timeStamp'] == null ? null : DateTime.parse(json['timeStamp']);
    lecture =
      
      
      new Lecture.fromJson(json['lecture'])
;
    user =
      
      
      new ILAUser.fromJson(json['user'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'timeStamp': timeStamp == null ? '' : timeStamp.toUtc().toIso8601String(),
      'lecture': lecture,
      'user': user
     };
  }

  static List<Pause> listFromJson(List<dynamic> json) {
    return json == null ? new List<Pause>() : json.map((value) => new Pause.fromJson(value)).toList();
  }

  static Map<String, Pause> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Pause>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Pause.fromJson(value));
    }
    return map;
  }
}

