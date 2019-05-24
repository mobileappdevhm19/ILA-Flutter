part of ila_swagger.api;

class IdentityUserOfString {
  
  String id = null;
  

  String userName = null;
  

  String normalizedUserName = null;
  

  String email = null;
  

  String normalizedEmail = null;
  

  bool emailConfirmed = null;
  

  String passwordHash = null;
  

  String securityStamp = null;
  

  String concurrencyStamp = null;
  

  String phoneNumber = null;
  

  bool phoneNumberConfirmed = null;
  

  bool twoFactorEnabled = null;
  

  DateTime lockoutEnd = null;
  

  bool lockoutEnabled = null;
  

  int accessFailedCount = null;
  
  IdentityUserOfString();

  @override
  String toString() {
    return 'IdentityUserOfString[id=$id, userName=$userName, normalizedUserName=$normalizedUserName, email=$email, normalizedEmail=$normalizedEmail, emailConfirmed=$emailConfirmed, passwordHash=$passwordHash, securityStamp=$securityStamp, concurrencyStamp=$concurrencyStamp, phoneNumber=$phoneNumber, phoneNumberConfirmed=$phoneNumberConfirmed, twoFactorEnabled=$twoFactorEnabled, lockoutEnd=$lockoutEnd, lockoutEnabled=$lockoutEnabled, accessFailedCount=$accessFailedCount, ]';
  }

  IdentityUserOfString.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    userName =
        json['userName']
    ;
    normalizedUserName =
        json['normalizedUserName']
    ;
    email =
        json['email']
    ;
    normalizedEmail =
        json['normalizedEmail']
    ;
    emailConfirmed =
        json['emailConfirmed']
    ;
    passwordHash =
        json['passwordHash']
    ;
    securityStamp =
        json['securityStamp']
    ;
    concurrencyStamp =
        json['concurrencyStamp']
    ;
    phoneNumber =
        json['phoneNumber']
    ;
    phoneNumberConfirmed =
        json['phoneNumberConfirmed']
    ;
    twoFactorEnabled =
        json['twoFactorEnabled']
    ;
    lockoutEnd = json['lockoutEnd'] == null ? null : DateTime.parse(json['lockoutEnd']);
    lockoutEnabled =
        json['lockoutEnabled']
    ;
    accessFailedCount =
        json['accessFailedCount']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'normalizedUserName': normalizedUserName,
      'email': email,
      'normalizedEmail': normalizedEmail,
      'emailConfirmed': emailConfirmed,
      'passwordHash': passwordHash,
      'securityStamp': securityStamp,
      'concurrencyStamp': concurrencyStamp,
      'phoneNumber': phoneNumber,
      'phoneNumberConfirmed': phoneNumberConfirmed,
      'twoFactorEnabled': twoFactorEnabled,
      'lockoutEnd': lockoutEnd == null ? '' : lockoutEnd.toUtc().toIso8601String(),
      'lockoutEnabled': lockoutEnabled,
      'accessFailedCount': accessFailedCount
     };
  }

  static List<IdentityUserOfString> listFromJson(List<dynamic> json) {
    return json == null ? new List<IdentityUserOfString>() : json.map((value) => new IdentityUserOfString.fromJson(value)).toList();
  }

  static Map<String, IdentityUserOfString> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, IdentityUserOfString>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new IdentityUserOfString.fromJson(value));
    }
    return map;
  }
}

