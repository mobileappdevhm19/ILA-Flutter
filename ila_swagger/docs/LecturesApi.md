# ila_swagger.api.LecturesApi

## Load the API package
```dart
import 'package:ila_swagger/api.dart';
```

All URIs are relative to *https://ila.dev.kirschbaum.bayern*

Method | HTTP request | Description
------------- | ------------- | -------------
[**lecturesDeleteLecture**](LecturesApi.md#lecturesDeleteLecture) | **DELETE** /api/Lectures/{id} | 
[**lecturesGetMemberLectures**](LecturesApi.md#lecturesGetMemberLectures) | **GET** /api/Lectures/member/{courseId} | 
[**lecturesGetOwnerLectures**](LecturesApi.md#lecturesGetOwnerLectures) | **GET** /api/Lectures/owner/{courseId} | 
[**lecturesPostLecture**](LecturesApi.md#lecturesPostLecture) | **POST** /api/Lectures/{courseId} | 
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

