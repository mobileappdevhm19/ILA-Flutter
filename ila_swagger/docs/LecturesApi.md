# ila_swagger.api.LecturesApi

## Load the API package
```dart
import 'package:ila_swagger/api.dart';
```

All URIs are relative to *https://ila.dev.kirschbaum.bayern*

Method | HTTP request | Description
------------- | ------------- | -------------
[**lecturesGet**](LecturesApi.md#lecturesGet) | **GET** /api/Lectures/{lectureId} | 
[**lecturesGetAll**](LecturesApi.md#lecturesGetAll) | **GET** /api/Lectures/all/{courseId} | 
[**lecturesPostPause**](LecturesApi.md#lecturesPostPause) | **POST** /api/Lectures/{lectureId}/pause | 
[**lecturesPut**](LecturesApi.md#lecturesPut) | **PUT** /api/Lectures/{id} | 


# **lecturesGet**
> Lecture lecturesGet(lectureId)



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
    var result = api_instance.lecturesGet(lectureId);
    print(result);
} catch (e) {
    print("Exception when calling LecturesApi->lecturesGet: $e\n");
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

# **lecturesGetAll**
> List<Lecture> lecturesGetAll(courseId)



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
    var result = api_instance.lecturesGetAll(courseId);
    print(result);
} catch (e) {
    print("Exception when calling LecturesApi->lecturesGetAll: $e\n");
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

# **lecturesPostPause**
> Pause lecturesPostPause(lectureId)



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

[**Pause**](Pause.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **lecturesPut**
> Lecture lecturesPut(id, lectureModel)



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
    var result = api_instance.lecturesPut(id, lectureModel);
    print(result);
} catch (e) {
    print("Exception when calling LecturesApi->lecturesPut: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **lectureModel** | [**LectureCreateUpdateModel**](LectureCreateUpdateModel.md)|  | 

### Return type

[**Lecture**](Lecture.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

