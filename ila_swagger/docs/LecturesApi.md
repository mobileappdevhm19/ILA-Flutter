# ila_swagger.api.LecturesApi

## Load the API package
```dart
import 'package:ila_swagger/api.dart';
```

All URIs are relative to *https://ila.dev.kirschbaum.bayern*

Method | HTTP request | Description
------------- | ------------- | -------------
[**lecturesDeleteLecture**](LecturesApi.md#lecturesDeleteLecture) | **DELETE** /api/Lectures/{id} | 
[**lecturesGetMemberLecture**](LecturesApi.md#lecturesGetMemberLecture) | **GET** /api/Lectures/memberLecture/{lectureId} | 
[**lecturesGetMemberLectures**](LecturesApi.md#lecturesGetMemberLectures) | **GET** /api/Lectures/member/{courseId} | 
[**lecturesGetOwnerLecture**](LecturesApi.md#lecturesGetOwnerLecture) | **GET** /api/Lectures/ownerLecture/{lectureId} | 
[**lecturesGetOwnerLectures**](LecturesApi.md#lecturesGetOwnerLectures) | **GET** /api/Lectures/owner/{courseId} | 
[**lecturesGetQuestion**](LecturesApi.md#lecturesGetQuestion) | **GET** /api/Lectures/questions/{lectureId} | 
[**lecturesPostLecture**](LecturesApi.md#lecturesPostLecture) | **POST** /api/Lectures/{courseId} | 
[**lecturesPostPause**](LecturesApi.md#lecturesPostPause) | **POST** /api/Lectures/pause/{lectureId} | 
[**lecturesPostQuestion**](LecturesApi.md#lecturesPostQuestion) | **POST** /api/Lectures/questions/{lectureId} | 
[**lecturesPutLecture**](LecturesApi.md#lecturesPutLecture) | **PUT** /api/Lectures/{id} | 


# **lecturesDeleteLecture**
> Lecture lecturesDeleteLecture(id)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new LecturesApi();
var id = 56; // int | 

try { 
    var result = api_instance.lecturesDeleteLecture(id);
    print(result);
} catch (e) {
    print("Exception when calling LecturesApi->lecturesDeleteLecture: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**Lecture**](Lecture.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **lecturesGetMemberLecture**
> Lecture lecturesGetMemberLecture(lectureId)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new LecturesApi();
var lectureId = 56; // int | 

try { 
    var result = api_instance.lecturesGetMemberLecture(lectureId);
    print(result);
} catch (e) {
    print("Exception when calling LecturesApi->lecturesGetMemberLecture: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lectureId** | **int**|  | 

### Return type

[**Lecture**](Lecture.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **lecturesGetMemberLectures**
> List<Lecture> lecturesGetMemberLectures(courseId)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new LecturesApi();
var courseId = 56; // int | 

try { 
    var result = api_instance.lecturesGetMemberLectures(courseId);
    print(result);
} catch (e) {
    print("Exception when calling LecturesApi->lecturesGetMemberLectures: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **int**|  | 

### Return type

[**List<Lecture>**](Lecture.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **lecturesGetOwnerLecture**
> Lecture lecturesGetOwnerLecture(lectureId)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new LecturesApi();
var lectureId = 56; // int | 

try { 
    var result = api_instance.lecturesGetOwnerLecture(lectureId);
    print(result);
} catch (e) {
    print("Exception when calling LecturesApi->lecturesGetOwnerLecture: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lectureId** | **int**|  | 

### Return type

[**Lecture**](Lecture.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **lecturesGetOwnerLectures**
> List<Lecture> lecturesGetOwnerLectures(courseId)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new LecturesApi();
var courseId = 56; // int | 

try { 
    var result = api_instance.lecturesGetOwnerLectures(courseId);
    print(result);
} catch (e) {
    print("Exception when calling LecturesApi->lecturesGetOwnerLectures: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **int**|  | 

### Return type

[**List<Lecture>**](Lecture.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **lecturesGetQuestion**
> List<Question> lecturesGetQuestion(lectureId)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new LecturesApi();
var lectureId = 56; // int | 

try { 
    var result = api_instance.lecturesGetQuestion(lectureId);
    print(result);
} catch (e) {
    print("Exception when calling LecturesApi->lecturesGetQuestion: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lectureId** | **int**|  | 

### Return type

[**List<Question>**](Question.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **lecturesPostLecture**
> List<Lecture> lecturesPostLecture(courseId, lectureModel)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new LecturesApi();
var courseId = 56; // int | 
var lectureModel = new LectureCreateUpdateModel(); // LectureCreateUpdateModel | 

try { 
    var result = api_instance.lecturesPostLecture(courseId, lectureModel);
    print(result);
} catch (e) {
    print("Exception when calling LecturesApi->lecturesPostLecture: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **int**|  | 
 **lectureModel** | [**LectureCreateUpdateModel**](LectureCreateUpdateModel.md)|  | 

### Return type

[**List<Lecture>**](Lecture.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **lecturesPostPause**
> MultipartFile lecturesPostPause(lectureId)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new LecturesApi();
var lectureId = 56; // int | 

try { 
    var result = api_instance.lecturesPostPause(lectureId);
    print(result);
} catch (e) {
    print("Exception when calling LecturesApi->lecturesPostPause: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lectureId** | **int**|  | 

### Return type

[**MultipartFile**](File.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **lecturesPostQuestion**
> Question lecturesPostQuestion(lectureId, model)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new LecturesApi();
var lectureId = 56; // int | 
var model = new QuestionCreate(); // QuestionCreate | 

try { 
    var result = api_instance.lecturesPostQuestion(lectureId, model);
    print(result);
} catch (e) {
    print("Exception when calling LecturesApi->lecturesPostQuestion: $e\n");
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

# **lecturesPutLecture**
> List<Lecture> lecturesPutLecture(id, lectureModel)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new LecturesApi();
var id = 56; // int | 
var lectureModel = new LectureCreateUpdateModel(); // LectureCreateUpdateModel | 

try { 
    var result = api_instance.lecturesPutLecture(id, lectureModel);
    print(result);
} catch (e) {
    print("Exception when calling LecturesApi->lecturesPutLecture: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **lectureModel** | [**LectureCreateUpdateModel**](LectureCreateUpdateModel.md)|  | 

### Return type

[**List<Lecture>**](Lecture.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

