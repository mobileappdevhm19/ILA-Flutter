part of ila_swagger.api;

class QuestionCreate {
  
  String pointedQuestion = null;
  
  QuestionCreate();

  @override
  String toString() {
    return 'QuestionCreate[pointedQuestion=$pointedQuestion, ]';
  }

  QuestionCreate.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    pointedQuestion =
        json['pointedQuestion']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'pointedQuestion': pointedQuestion
     };
  }

  static List<QuestionCreate> listFromJson(List<dynamic> json) {
    return json == null ? new List<QuestionCreate>() : json.map((value) => new QuestionCreate.fromJson(value)).toList();
  }

  static Map<String, QuestionCreate> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, QuestionCreate>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new QuestionCreate.fromJson(value));
    }
    return map;
  }
}

