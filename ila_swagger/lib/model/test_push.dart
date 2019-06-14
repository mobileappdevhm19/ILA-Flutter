part of ila_swagger.api;

class TestPush {
  
  String message = null;
  
  TestPush();

  @override
  String toString() {
    return 'TestPush[message=$message, ]';
  }

  TestPush.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    message =
        json['message']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message
     };
  }

  static List<TestPush> listFromJson(List<dynamic> json) {
    return json == null ? new List<TestPush>() : json.map((value) => new TestPush.fromJson(value)).toList();
  }

  static Map<String, TestPush> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, TestPush>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new TestPush.fromJson(value));
    }
    return map;
  }
}

