part of ila_swagger.api;



class QuestionApi {
  final ApiClient apiClient;

  QuestionApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// 
  ///
  /// 
  Future<Answer> questionDeleteAnswer(int answerId) async {
    Object postBody = null;

    // verify required params are set
    if(answerId == null) {
     throw new ApiException(400, "Missing required param: answerId");
    }

    // create path and map variables
    String path = "/api/Question/answers/{answerId}".replaceAll("{format}","json").replaceAll("{" + "answerId" + "}", answerId.toString());

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
                                             'DELETE',
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
          apiClient.deserialize(response.body, 'Answer') as Answer ;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<Question> questionDeleteQuestion(int questionId) async {
    Object postBody = null;

    // verify required params are set
    if(questionId == null) {
     throw new ApiException(400, "Missing required param: questionId");
    }

    // create path and map variables
    String path = "/api/Question/{questionId}".replaceAll("{format}","json").replaceAll("{" + "questionId" + "}", questionId.toString());

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
                                             'DELETE',
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
          apiClient.deserialize(response.body, 'Question') as Question ;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<Question> questionGet(int id) async {
    Object postBody = null;

    // verify required params are set
    if(id == null) {
     throw new ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/Question/{id}".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

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
          apiClient.deserialize(response.body, 'Question') as Question ;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<List<Question>> questionGetAll() async {
    Object postBody = null;

    // verify required params are set

    // create path and map variables
    String path = "/api/Question".replaceAll("{format}","json");

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
        (apiClient.deserialize(response.body, 'List<Question>') as List).map((item) => item as Question).toList();
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<List<Answer>> questionGetAnswers(int questionId) async {
    Object postBody = null;

    // verify required params are set
    if(questionId == null) {
     throw new ApiException(400, "Missing required param: questionId");
    }

    // create path and map variables
    String path = "/api/Question/{questionId}/answers".replaceAll("{format}","json").replaceAll("{" + "questionId" + "}", questionId.toString());

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
        (apiClient.deserialize(response.body, 'List<Answer>') as List).map((item) => item as Answer).toList();
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<List<Question>> questionGetLecture(int id) async {
    Object postBody = null;

    // verify required params are set
    if(id == null) {
     throw new ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/api/Question/lecture/{id}".replaceAll("{format}","json").replaceAll("{" + "id" + "}", id.toString());

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
        (apiClient.deserialize(response.body, 'List<Question>') as List).map((item) => item as Question).toList();
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<Answer> questionPostAnswer(int questionId, AnswerCreate model) async {
    Object postBody = model;

    // verify required params are set
    if(questionId == null) {
     throw new ApiException(400, "Missing required param: questionId");
    }
    if(model == null) {
     throw new ApiException(400, "Missing required param: model");
    }

    // create path and map variables
    String path = "/api/Question/{questionId}/answer".replaceAll("{format}","json").replaceAll("{" + "questionId" + "}", questionId.toString());

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
          apiClient.deserialize(response.body, 'Answer') as Answer ;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<Question> questionPostQuestion(int lectureId, QuestionCreate model) async {
    Object postBody = model;

    // verify required params are set
    if(lectureId == null) {
     throw new ApiException(400, "Missing required param: lectureId");
    }
    if(model == null) {
     throw new ApiException(400, "Missing required param: model");
    }

    // create path and map variables
    String path = "/api/Question/questions/{lectureId}".replaceAll("{format}","json").replaceAll("{" + "lectureId" + "}", lectureId.toString());

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
          apiClient.deserialize(response.body, 'Question') as Question ;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<Answer> questionPutAnswer(int answerId, AnswerCreate model) async {
    Object postBody = model;

    // verify required params are set
    if(answerId == null) {
     throw new ApiException(400, "Missing required param: answerId");
    }
    if(model == null) {
     throw new ApiException(400, "Missing required param: model");
    }

    // create path and map variables
    String path = "/api/Question/answers/{answerId}".replaceAll("{format}","json").replaceAll("{" + "answerId" + "}", answerId.toString());

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
          apiClient.deserialize(response.body, 'Answer') as Answer ;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<Question> questionPutQuestion(int questionId, QuestionCreate model) async {
    Object postBody = model;

    // verify required params are set
    if(questionId == null) {
     throw new ApiException(400, "Missing required param: questionId");
    }
    if(model == null) {
     throw new ApiException(400, "Missing required param: model");
    }

    // create path and map variables
    String path = "/api/Question/{questionId}".replaceAll("{format}","json").replaceAll("{" + "questionId" + "}", questionId.toString());

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
          apiClient.deserialize(response.body, 'Question') as Question ;
    } else {
      return null;
    }
  }
}
