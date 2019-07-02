part of ila_swagger.api;

class Question {
  
  int id = null;
  

  String pointedQuestion = null;
  

  String title = null;
  

  DateTime createdAt = null;
  

  int lectureId = null;
  

  Lecture lecture = null;
  

  ILAUser user = null;
  

  List<Answer> answers = [];
  
  Question();

  @override
  String toString() {
    return 'Question[id=$id, pointedQuestion=$pointedQuestion, title=$title, createdAt=$createdAt, lectureId=$lectureId, lecture=$lecture, user=$user, answers=$answers, ]';
  }

  Question.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    pointedQuestion =
        json['pointedQuestion']
    ;
    title =
        json['title']
    ;
    createdAt = json['createdAt'] == null ? null : DateTime.parse(json['createdAt']);
    lectureId =
        json['lectureId']
    ;
    lecture =
      
      
      new Lecture.fromJson(json['lecture'])
;
    user =
      
      
      new ILAUser.fromJson(json['user'])
;
    answers =
      Answer.listFromJson(json['answers'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pointedQuestion': pointedQuestion,
      'title': title,
      'createdAt': createdAt == null ? '' : createdAt.toUtc().toIso8601String(),
      'lectureId': lectureId,
      'lecture': lecture,
      'user': user,
      'answers': answers
     };
  }

  static List<Question> listFromJson(List<dynamic> json) {
    return json == null ? new List<Question>() : json.map((value) => new Question.fromJson(value)).toList();
  }

  static Map<String, Question> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Question>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Question.fromJson(value));
    }
    return map;
  }
}

