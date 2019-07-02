part of ila_swagger.api;

class ProfQuestionAnswer {
  
  int id = null;
  

  DateTime createdAt = null;
  

  int profAnswerId = null;
  

  ProfAnswer profAnswer = null;
  

  ILAUser user = null;
  
  ProfQuestionAnswer();

  @override
  String toString() {
    return 'ProfQuestionAnswer[id=$id, createdAt=$createdAt, profAnswerId=$profAnswerId, profAnswer=$profAnswer, user=$user, ]';
  }

  ProfQuestionAnswer.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    createdAt = json['createdAt'] == null ? null : DateTime.parse(json['createdAt']);
    profAnswerId =
        json['profAnswerId']
    ;
    profAnswer =
      
      
      new ProfAnswer.fromJson(json['profAnswer'])
;
    user =
      
      
      new ILAUser.fromJson(json['user'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt == null ? '' : createdAt.toUtc().toIso8601String(),
      'profAnswerId': profAnswerId,
      'profAnswer': profAnswer,
      'user': user
     };
  }

  static List<ProfQuestionAnswer> listFromJson(List<dynamic> json) {
    return json == null ? new List<ProfQuestionAnswer>() : json.map((value) => new ProfQuestionAnswer.fromJson(value)).toList();
  }

  static Map<String, ProfQuestionAnswer> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ProfQuestionAnswer>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ProfQuestionAnswer.fromJson(value));
    }
    return map;
  }
}

