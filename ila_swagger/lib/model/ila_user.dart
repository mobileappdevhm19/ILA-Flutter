part of ila_swagger.api;

class ILAUser {
  
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
  

  String firstName = null;
  

  String lastName = null;
  

  List<Course> myCourses = [];
  

  List<CourseMember> memberCourses = [];
  

  List<Pause> pauses = [];
  

  List<Question> questions = [];
  

  List<ProfQuestionAnswer> profAnswers = [];
  

  List<Answer> answers = [];
  

  List<PushTokens> pushTokens = [];
  
  ILAUser();

  @override
  String toString() {
    return 'ILAUser[id=$id, userName=$userName, normalizedUserName=$normalizedUserName, email=$email, normalizedEmail=$normalizedEmail, emailConfirmed=$emailConfirmed, passwordHash=$passwordHash, securityStamp=$securityStamp, concurrencyStamp=$concurrencyStamp, phoneNumber=$phoneNumber, phoneNumberConfirmed=$phoneNumberConfirmed, twoFactorEnabled=$twoFactorEnabled, lockoutEnd=$lockoutEnd, lockoutEnabled=$lockoutEnabled, accessFailedCount=$accessFailedCount, firstName=$firstName, lastName=$lastName, myCourses=$myCourses, memberCourses=$memberCourses, pauses=$pauses, questions=$questions, profAnswers=$profAnswers, answers=$answers, pushTokens=$pushTokens, ]';
  }

  ILAUser.fromJson(Map<String, dynamic> json) {
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
    firstName =
        json['firstName']
    ;
    lastName =
        json['lastName']
    ;
    myCourses =
      Course.listFromJson(json['myCourses'])
;
    memberCourses =
      CourseMember.listFromJson(json['memberCourses'])
;
    pauses =
      Pause.listFromJson(json['pauses'])
;
    questions =
      Question.listFromJson(json['questions'])
;
    profAnswers =
      ProfQuestionAnswer.listFromJson(json['profAnswers'])
;
    answers =
      Answer.listFromJson(json['answers'])
;
    pushTokens =
      PushTokens.listFromJson(json['pushTokens'])
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
      'accessFailedCount': accessFailedCount,
      'firstName': firstName,
      'lastName': lastName,
      'myCourses': myCourses,
      'memberCourses': memberCourses,
      'pauses': pauses,
      'questions': questions,
      'profAnswers': profAnswers,
      'answers': answers,
      'pushTokens': pushTokens
     };
  }

  static List<ILAUser> listFromJson(List<dynamic> json) {
    return json == null ? new List<ILAUser>() : json.map((value) => new ILAUser.fromJson(value)).toList();
  }

  static Map<String, ILAUser> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ILAUser>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ILAUser.fromJson(value));
    }
    return map;
  }
}

