part of ila_swagger.api;

class SavePushToken {
  
  String deviceId = null;
  

  String token = null;
  
  SavePushToken();

  @override
  String toString() {
    return 'SavePushToken[deviceId=$deviceId, token=$token, ]';
  }

  SavePushToken.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    deviceId =
        json['deviceId']
    ;
    token =
        json['token']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'deviceId': deviceId,
      'token': token
     };
  }

  static List<SavePushToken> listFromJson(List<dynamic> json) {
    return json == null ? new List<SavePushToken>() : json.map((value) => new SavePushToken.fromJson(value)).toList();
  }

  static Map<String, SavePushToken> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, SavePushToken>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new SavePushToken.fromJson(value));
    }
    return map;
  }
}

