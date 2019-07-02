# ila_swagger.api.QuestionApi

## Load the API package
```dart
import 'package:ila_swagger/api.dart';
```

All URIs are relative to *https://ila.dev.kirschbaum.bayern*

Method | HTTP request | Description
------------- | ------------- | -------------
[**questionDeleteAnswer**](QuestionApi.md#questionDeleteAnswer) | **DELETE** /api/Question/answers/{answerId} | 
[**questionDeleteQuestion**](QuestionApi.md#questionDeleteQuestion) | **DELETE** /api/Question/{questionId} | 
[**questionGet**](QuestionApi.md#questionGet) | **GET** /api/Question/{id} | 
[**questionGetAll**](QuestionApi.md#questionGetAll) | **GET** /api/Question | 
[**questionGetAnswers**](QuestionApi.md#questionGetAnswers) | **GET** /api/Question/{questionId}/answers | 
[**questionGetLecture**](QuestionApi.md#questionGetLecture) | **GET** /api/Question/lecture/{id} | 
[**questionPostAnswer**](QuestionApi.md#questionPostAnswer) | **POST** /api/Question/{questionId}/answer | 
[**questionPostQuestion**](QuestionApi.md#questionPostQuestion) | **POST** /api/Question/questions/{lectureId} | 
[**questionPutAnswer**](QuestionApi.md#questionPutAnswer) | **PUT** /api/Question/answers/{answerId} | 
[**questionPutQuestion**](QuestionApi.md#questionPutQuestion) | **PUT** /api/Question/{questionId} | 


# **questionDeleteAnswer**
> Answer questionDeleteAnswer(answerId)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new QuestionApi();
var answerId = 56; // int | 

try { 
    var result = api_instance.questionDeleteAnswer(answerId);
    print(result);
} catch (e) {
    print("Exception when calling QuestionApi->questionDeleteAnswer: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **answerId** | **int**|  | 

### Return type

[**Answer**](Answer.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **questionDeleteQuestion**
> Question questionDeleteQuestion(questionId)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new QuestionApi();
var questionId = 56; // int | 

try { 
    var result = api_instance.questionDeleteQuestion(questionId);
    print(result);
} catch (e) {
    print("Exception when calling QuestionApi->questionDeleteQuestion: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **questionId** | **int**|  | 

### Return type

[**Question**](Question.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **questionGet**
> Question questionGet(id)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new QuestionApi();
var id = 56; // int | 

try { 
    var result = api_instance.questionGet(id);
    print(result);
} catch (e) {
    print("Exception when calling QuestionApi->questionGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**Question**](Question.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **questionGetAll**
> List<Question> questionGetAll()



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new QuestionApi();

try { 
    var result = api_instance.questionGetAll();
    print(result);
} catch (e) {
    print("Exception when calling QuestionApi->questionGetAll: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<Question>**](Question.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **questionGetAnswers**
> List<Answer> questionGetAnswers(questionId)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new QuestionApi();
var questionId = 56; // int | 

try { 
    var result = api_instance.questionGetAnswers(questionId);
    print(result);
} catch (e) {
    print("Exception when calling QuestionApi->questionGetAnswers: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **questionId** | **int**|  | 

### Return type

[**List<Answer>**](Answer.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **questionGetLecture**
> List<Question> questionGetLecture(id)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new QuestionApi();
var id = 56; // int | 

try { 
    var result = api_instance.questionGetLecture(id);
    print(result);
} catch (e) {
    print("Exception when calling QuestionApi->questionGetLecture: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**List<Question>**](Question.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **questionPostAnswer**
> Answer questionPostAnswer(questionId, model)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new QuestionApi();
var questionId = 56; // int | 
var model = new AnswerCreate(); // AnswerCreate | 

try { 
    var result = api_instance.questionPostAnswer(questionId, model);
    print(result);
} catch (e) {
    print("Exception when calling QuestionApi->questionPostAnswer: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **questionId** | **int**|  | 
 **model** | [**AnswerCreate**](AnswerCreate.md)|  | 

### Return type

[**Answer**](Answer.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **questionPostQuestion**
> Question questionPostQuestion(lectureId, model)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new QuestionApi();
var lectureId = 56; // int | 
var model = new QuestionCreate(); // QuestionCreate | 

try { 
    var result = api_instance.questionPostQuestion(lectureId, model);
    print(result);
} catch (e) {
    print("Exception when calling QuestionApi->questionPostQuestion: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lectureId** | **int**|  | 
 **model** | [**QuestionCreate**](QuestionCreate.md)|  | 

### Return type

[**Question**](Question.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **questionPutAnswer**
> Answer questionPutAnswer(answerId, model)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new QuestionApi();
var answerId = 56; // int | 
var model = new AnswerCreate(); // AnswerCreate | 

try { 
    var result = api_instance.questionPutAnswer(answerId, model);
    print(result);
} catch (e) {
    print("Exception when calling QuestionApi->questionPutAnswer: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **answerId** | **int**|  | 
 **model** | [**AnswerCreate**](AnswerCreate.md)|  | 

### Return type

[**Answer**](Answer.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **questionPutQuestion**
> Question questionPutQuestion(questionId, model)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new QuestionApi();
var questionId = 56; // int | 
var model = new QuestionCreate(); // QuestionCreate | 

try { 
    var result = api_instance.questionPutQuestion(questionId, model);
    print(result);
} catch (e) {
    print("Exception when calling QuestionApi->questionPutQuestion: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **questionId** | **int**|  | 
 **model** | [**QuestionCreate**](QuestionCreate.md)|  | 

### Return type

[**Question**](Question.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

