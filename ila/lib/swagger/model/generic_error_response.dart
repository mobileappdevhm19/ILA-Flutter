part of swagger.api;

class GenericErrorResponse {
  
  List<String> errors = [];
  
  GenericErrorResponse();

  @override
  String toString() {
    return 'GenericErrorResponse[errors=$errors, ]';
  }

  GenericErrorResponse.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    errors =
        (json['errors'] as List).map((item) => item as String).toList()
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'errors': errors
     };
  }

  static List<GenericErrorResponse> listFromJson(List<dynamic> json) {
    return json == null ? new List<GenericErrorResponse>() : json.map((value) => new GenericErrorResponse.fromJson(value)).toList();
  }

  static Map<String, GenericErrorResponse> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, GenericErrorResponse>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new GenericErrorResponse.fromJson(value));
    }
    return map;
  }
}

