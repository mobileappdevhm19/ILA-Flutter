part of swagger.api;

class MemberModel {
  
  int id = null;
  

  String name = null;
  

  String email = null;
  
  MemberModel();

  @override
  String toString() {
    return 'MemberModel[id=$id, name=$name, email=$email, ]';
  }

  MemberModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    name =
        json['name']
    ;
    email =
        json['email']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email
     };
  }

  static List<MemberModel> listFromJson(List<dynamic> json) {
    return json == null ? new List<MemberModel>() : json.map((value) => new MemberModel.fromJson(value)).toList();
  }

  static Map<String, MemberModel> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, MemberModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new MemberModel.fromJson(value));
    }
    return map;
  }
}

