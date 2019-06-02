part of ila_swagger.api;

class AnswerCreate {
  
  String comment = null;
  
  AnswerCreate();

  @override
  String toString() {
    return 'AnswerCreate[comment=$comment, ]';
  }

  AnswerCreate.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    comment =
        json['comment']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'comment': comment
     };
  }

  static List<AnswerCreate> listFromJson(List<dynamic> json) {
    return json == null ? new List<AnswerCreate>() : json.map((value) => new AnswerCreate.fromJson(value)).toList();
  }

  static Map<String, AnswerCreate> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, AnswerCreate>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new AnswerCreate.fromJson(value));
    }
    return map;
  }
}

