part of ila_swagger.api;

class ProfAnswer {
  
  int id = null;
  

  String answer = null;
  

  int profQuestionId = null;
  

  ProfQuestion profQuestion = null;
  

  List<ProfQuestionAnswer> profQuestionAnswers = [];
  
  ProfAnswer();

  @override
  String toString() {
    return 'ProfAnswer[id=$id, answer=$answer, profQuestionId=$profQuestionId, profQuestion=$profQuestion, profQuestionAnswers=$profQuestionAnswers, ]';
  }

  ProfAnswer.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    answer =
        json['answer']
    ;
    profQuestionId =
        json['profQuestionId']
    ;
    profQuestion =
      
      
      new ProfQuestion.fromJson(json['profQuestion'])
;
    profQuestionAnswers =
      ProfQuestionAnswer.listFromJson(json['profQuestionAnswers'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'answer': answer,
      'profQuestionId': profQuestionId,
      'profQuestion': profQuestion,
      'profQuestionAnswers': profQuestionAnswers
     };
  }

  static List<ProfAnswer> listFromJson(List<dynamic> json) {
    return json == null ? new List<ProfAnswer>() : json.map((value) => new ProfAnswer.fromJson(value)).toList();
  }

  static Map<String, ProfAnswer> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ProfAnswer>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ProfAnswer.fromJson(value));
    }
    return map;
  }
}

