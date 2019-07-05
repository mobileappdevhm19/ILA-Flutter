# ila_swagger.api.CoursesApi

## Load the API package
```dart
import 'package:ila_swagger/api.dart';
```

All URIs are relative to *https://ila.dev.kirschbaum.bayern*

Method | HTTP request | Description
------------- | ------------- | -------------
[**coursesGet**](CoursesApi.md#coursesGet) | **GET** /api/Courses/{id} | 
[**coursesGetAll**](CoursesApi.md#coursesGetAll) | **GET** /api/Courses | 
[**coursesJoin**](CoursesApi.md#coursesJoin) | **POST** /api/Courses/{courseId}/join | 
[**coursesLeave**](CoursesApi.md#coursesLeave) | **POST** /api/Courses/{courseId}/leave | 


# **coursesGet**
> Course coursesGet(id)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new CoursesApi();
var id = 56; // int | 

try { 
    var result = api_instance.coursesGet(id);
    print(result);
} catch (e) {
    print("Exception when calling CoursesApi->coursesGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**Course**](Course.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **coursesGetAll**
> List<Course> coursesGetAll()



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new CoursesApi();

try { 
    var result = api_instance.coursesGetAll();
    print(result);
} catch (e) {
    print("Exception when calling CoursesApi->coursesGetAll: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<Course>**](Course.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **coursesJoin**
> List<Course> coursesJoin(courseId, token)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new CoursesApi();
var courseId = 56; // int | 
var token = token_example; // String | 

try { 
    var result = api_instance.coursesJoin(courseId, token);
    print(result);
} catch (e) {
    print("Exception when calling CoursesApi->coursesJoin: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **int**|  | 
 **token** | **String**|  | [optional] 

### Return type

[**List<Course>**](Course.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **coursesLeave**
> List<Course> coursesLeave(courseId)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new CoursesApi();
var courseId = 56; // int | 

try { 
    var result = api_instance.coursesLeave(courseId);
    print(result);
} catch (e) {
    print("Exception when calling CoursesApi->coursesLeave: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **int**|  | 

### Return type

[**List<Course>**](Course.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

