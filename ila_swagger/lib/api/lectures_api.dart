part of ila_swagger.api;



class LecturesApi {
  final ApiClient apiClient;

  LecturesApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// 
  ///
  /// 
  Future<Lecture> lecturesGet(int lectureId) async {
    Object postBody = null;

    // verify required params are set
    if(lectureId == null) {
     throw new ApiException(400, "Missing required param: lectureId");
    }

    // create path and map variables
    String path = "/api/Lectures/{lectureId}".replaceAll("{format}","json").replaceAll("{" + "lectureId" + "}", lectureId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["JWT"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return 
          apiClient.deserialize(response.body, 'Lecture') as Lecture ;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<List<Lecture>> lecturesGetAll(int courseId) async {
    Object postBody = null;

    // verify required params are set
    if(courseId == null) {
     throw new ApiException(400, "Missing required param: courseId");
    }

    // create path and map variables
    String path = "/api/Lectures/all/{courseId}".replaceAll("{format}","json").replaceAll("{" + "courseId" + "}", courseId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["JWT"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return 
        (apiClient.deserialize(response.body, 'List<Lecture>') as List).map((item) => item as Lecture).toList();
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<Pause> lecturesPostPause(int lectureId) async {
    Object postBody = null;

    // verify required params are set
    if(lectureId == null) {
     throw new ApiException(400, "Missing required param: lectureId");
    }

    // create path and map variables
    String path = "/api/Lectures/{lectureId}/pause".replaceAll("{format}","json").replaceAll("{" + "lectureId" + "}", lectureId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["JWT"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return 
          apiClient.deserialize(response.body, 'Pause') as Pause ;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<Lecture> lecturesPut(int id, LectureCreateUpdateModel lectureModel) async {
    Object postBody = lectureModel;

    // verify required params are set
    if(id == null) {
     throw new ApiException(400, "Missing required param: id");
    }
    if(lectureModel == null) {
     throw new ApiException(400, "Missing required param: lectureModel");
    }

    // create path and map variables
    String path = "/api/Lectures/{id}".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = ["application/json-patch+json","application/json","text/json","application/_*+json"];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["JWT"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'PUT',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return 
          apiClient.deserialize(response.body, 'Lecture') as Lecture ;
    } else {
      return null;
    }
  }
}
