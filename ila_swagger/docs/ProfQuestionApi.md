# ila_swagger.api.ProfQuestionApi

## Load the API package
```dart
import 'package:ila_swagger/api.dart';
```

All URIs are relative to *https://ila.dev.kirschbaum.bayern*

Method | HTTP request | Description
------------- | ------------- | -------------
[**profQuestionAnswer**](ProfQuestionApi.md#profQuestionAnswer) | **POST** /api/ProfQuestion/{answerId} | 
[**profQuestionGet**](ProfQuestionApi.md#profQuestionGet) | **GET** /api/ProfQuestion/{lectureId} | 


# **profQuestionAnswer**
> ProfQuestionAnswer profQuestionAnswer(answerId)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new ProfQuestionApi();
var answerId = 56; // int | 

try { 
    var result = api_instance.profQuestionAnswer(answerId);
    print(result);
} catch (e) {
    print("Exception when calling ProfQuestionApi->profQuestionAnswer: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **answerId** | **int**|  | 

### Return type

[**ProfQuestionAnswer**](ProfQuestionAnswer.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **profQuestionGet**
> List<ProfQuestion> profQuestionGet(lectureId)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new ProfQuestionApi();
var lectureId = 56; // int | 

try { 
    var result = api_instance.profQuestionGet(lectureId);
    print(result);
} catch (e) {
    print("Exception when calling ProfQuestionApi->profQuestionGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lectureId** | **int**|  | 

### Return type

[**List<ProfQuestion>**](ProfQuestion.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

