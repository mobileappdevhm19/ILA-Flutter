part of ila_swagger.api;



class ProfQuestionApi {
  final ApiClient apiClient;

  ProfQuestionApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// 
  ///
  /// 
  Future<ProfQuestionAnswer> profQuestionAnswer(int answerId) async {
    Object postBody = null;

    // verify required params are set
    if(answerId == null) {
     throw new ApiException(400, "Missing required param: answerId");
    }

    // create path and map variables
    String path = "/api/ProfQuestion/{answerId}".replaceAll("{format}","json").replaceAll("{" + "answerId" + "}", answerId.toString());

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
          apiClient.deserialize(response.body, 'ProfQuestionAnswer') as ProfQuestionAnswer ;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<List<ProfQuestion>> profQuestionGet(int lectureId) async {
    Object postBody = null;

    // verify required params are set
    if(lectureId == null) {
     throw new ApiException(400, "Missing required param: lectureId");
    }

    // create path and map variables
    String path = "/api/ProfQuestion/{lectureId}".replaceAll("{format}","json").replaceAll("{" + "lectureId" + "}", lectureId.toString());

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
        (apiClient.deserialize(response.body, 'List<ProfQuestion>') as List).map((item) => item as ProfQuestion).toList();
    } else {
      return null;
    }
  }
}
