part of ila_swagger.api;

class ProfQuestion {
  
  int id = null;
  

  String title = null;
  

  String question = null;
  

  DateTime createdAt = null;
  

  int lectureId = null;
  

  Lecture lecture = null;
  

  List<ProfAnswer> answers = [];
  
  ProfQuestion();

  @override
  String toString() {
    return 'ProfQuestion[id=$id, title=$title, question=$question, createdAt=$createdAt, lectureId=$lectureId, lecture=$lecture, answers=$answers, ]';
  }

  ProfQuestion.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    title =
        json['title']
    ;
    question =
        json['question']
    ;
    createdAt = json['createdAt'] == null ? null : DateTime.parse(json['createdAt']);
    lectureId =
        json['lectureId']
    ;
    lecture =
      
      
      new Lecture.fromJson(json['lecture'])
;
    answers =
      ProfAnswer.listFromJson(json['answers'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'question': question,
      'createdAt': createdAt == null ? '' : createdAt.toUtc().toIso8601String(),
      'lectureId': lectureId,
      'lecture': lecture,
      'answers': answers
     };
  }

  static List<ProfQuestion> listFromJson(List<dynamic> json) {
    return json == null ? new List<ProfQuestion>() : json.map((value) => new ProfQuestion.fromJson(value)).toList();
  }

  static Map<String, ProfQuestion> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ProfQuestion>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ProfQuestion.fromJson(value));
    }
    return map;
  }
}

