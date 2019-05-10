part of swagger.api;

class Answer {
  
  int id = null;
  

  String comment = null;
  

  int votes = 0;
  

  ILAUser user = null;
  

  Question question = null;
  
  Answer();

  @override
  String toString() {
    return 'Answer[id=$id, comment=$comment, votes=$votes, user=$user, question=$question, ]';
  }

  Answer.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    comment =
        json['comment']
    ;
    votes =
        json['votes']
    ;
    user =
      
      
      new ILAUser.fromJson(json['user'])
;
    question =
      
      
      new Question.fromJson(json['question'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'comment': comment,
      'votes': votes,
      'user': user,
      'question': question
     };
  }

  static List<Answer> listFromJson(List<dynamic> json) {
    return json == null ? new List<Answer>() : json.map((value) => new Answer.fromJson(value)).toList();
  }

  static Map<String, Answer> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Answer>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Answer.fromJson(value));
    }
    return map;
  }
}

