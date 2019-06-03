part of ila_swagger.api;

class PushTokens {
  
  int id = null;
  

  String token = null;
  

  String deviceId = null;
  

  ILAUser user = null;
  
  PushTokens();

  @override
  String toString() {
    return 'PushTokens[id=$id, token=$token, deviceId=$deviceId, user=$user, ]';
  }

  PushTokens.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    token =
        json['token']
    ;
    deviceId =
        json['deviceId']
    ;
    user =
      
      
      new ILAUser.fromJson(json['user'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'token': token,
      'deviceId': deviceId,
      'user': user
     };
  }

  static List<PushTokens> listFromJson(List<dynamic> json) {
    return json == null ? new List<PushTokens>() : json.map((value) => new PushTokens.fromJson(value)).toList();
  }

  static Map<String, PushTokens> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, PushTokens>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PushTokens.fromJson(value));
    }
    return map;
  }
}

