# ila_swagger.api.CoursesApi

## Load the API package
```dart
import 'package:ila_swagger/api.dart';
```

All URIs are relative to *https://ila.dev.kirschbaum.bayern*

Method | HTTP request | Description
------------- | ------------- | -------------
[**coursesDeleteCourse**](CoursesApi.md#coursesDeleteCourse) | **DELETE** /api/Courses/{id} | 
[**coursesDeleteToken**](CoursesApi.md#coursesDeleteToken) | **DELETE** /api/Courses/deleteToken/{tokenId} | 
[**coursesGenerateToken**](CoursesApi.md#coursesGenerateToken) | **POST** /api/Courses/generateToken/{courseId} | 
[**coursesGetMemberCourse**](CoursesApi.md#coursesGetMemberCourse) | **GET** /api/Courses/member/{id} | 
[**coursesGetMemberCourses**](CoursesApi.md#coursesGetMemberCourses) | **GET** /api/Courses/member | 
[**coursesGetOwnerCourse**](CoursesApi.md#coursesGetOwnerCourse) | **GET** /api/Courses/owner/{id} | 
[**coursesGetOwnerCourses**](CoursesApi.md#coursesGetOwnerCourses) | **GET** /api/Courses/owner | 
[**coursesJoinCourse**](CoursesApi.md#coursesJoinCourse) | **POST** /api/Courses/join/{courseId} | 
[**coursesLeaveCourse**](CoursesApi.md#coursesLeaveCourse) | **POST** /api/Courses/leave/{courseId} | 
[**coursesPostCourse**](CoursesApi.md#coursesPostCourse) | **POST** /api/Courses | 
[**coursesPutCourse**](CoursesApi.md#coursesPutCourse) | **PUT** /api/Courses/{id} | 
[**coursesUpdateToken**](CoursesApi.md#coursesUpdateToken) | **PUT** /api/Courses/updateToken/{tokenId} | 


# **coursesDeleteCourse**
> Course coursesDeleteCourse(id)



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
    var result = api_instance.coursesDeleteCourse(id);
    print(result);
} catch (e) {
    print("Exception when calling CoursesApi->coursesDeleteCourse: $e\n");
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

# **coursesDeleteToken**
> MultipartFile coursesDeleteToken(tokenId)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new CoursesApi();
var tokenId = 56; // int | 

try { 
    var result = api_instance.coursesDeleteToken(tokenId);
    print(result);
} catch (e) {
    print("Exception when calling CoursesApi->coursesDeleteToken: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tokenId** | **int**|  | 

### Return type

[**MultipartFile**](File.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **coursesGenerateToken**
> MultipartFile coursesGenerateToken(courseId)



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
    var result = api_instance.coursesGenerateToken(courseId);
    print(result);
} catch (e) {
    print("Exception when calling CoursesApi->coursesGenerateToken: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **int**|  | 

### Return type

[**MultipartFile**](File.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **coursesGetMemberCourse**
> Course coursesGetMemberCourse(id)



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
    var result = api_instance.coursesGetMemberCourse(id);
    print(result);
} catch (e) {
    print("Exception when calling CoursesApi->coursesGetMemberCourse: $e\n");
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

# **coursesGetMemberCourses**
> List<Course> coursesGetMemberCourses()



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new CoursesApi();

try { 
    var result = api_instance.coursesGetMemberCourses();
    print(result);
} catch (e) {
    print("Exception when calling CoursesApi->coursesGetMemberCourses: $e\n");
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

# **coursesGetOwnerCourse**
> Course coursesGetOwnerCourse(id)



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
    var result = api_instance.coursesGetOwnerCourse(id);
    print(result);
} catch (e) {
    print("Exception when calling CoursesApi->coursesGetOwnerCourse: $e\n");
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

# **coursesGetOwnerCourses**
> List<Course> coursesGetOwnerCourses()



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new CoursesApi();

try { 
    var result = api_instance.coursesGetOwnerCourses();
    print(result);
} catch (e) {
    print("Exception when calling CoursesApi->coursesGetOwnerCourses: $e\n");
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

# **coursesJoinCourse**
> MultipartFile coursesJoinCourse(courseId, token)



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
    var result = api_instance.coursesJoinCourse(courseId, token);
    print(result);
} catch (e) {
    print("Exception when calling CoursesApi->coursesJoinCourse: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **int**|  | 
 **token** | **String**|  | [optional] 

### Return type

[**MultipartFile**](File.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **coursesLeaveCourse**
> MultipartFile coursesLeaveCourse(courseId)



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
    var result = api_instance.coursesLeaveCourse(courseId);
    print(result);
} catch (e) {
    print("Exception when calling CoursesApi->coursesLeaveCourse: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **int**|  | 

### Return type

[**MultipartFile**](File.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **coursesPostCourse**
> Course coursesPostCourse(courseModel)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new CoursesApi();
var courseModel = new CourseCreateUpateModel(); // CourseCreateUpateModel | 

try { 
    var result = api_instance.coursesPostCourse(courseModel);
    print(result);
} catch (e) {
    print("Exception when calling CoursesApi->coursesPostCourse: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseModel** | [**CourseCreateUpateModel**](CourseCreateUpateModel.md)|  | 

### Return type

[**Course**](Course.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **coursesPutCourse**
> Course coursesPutCourse(id, courseModel)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new CoursesApi();
var id = 56; // int | 
var courseModel = new CourseCreateUpateModel(); // CourseCreateUpateModel | 

try { 
    var result = api_instance.coursesPutCourse(id, courseModel);
    print(result);
} catch (e) {
    print("Exception when calling CoursesApi->coursesPutCourse: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **courseModel** | [**CourseCreateUpateModel**](CourseCreateUpateModel.md)|  | 

### Return type

[**Course**](Course.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **coursesUpdateToken**
> CourseToken coursesUpdateToken(tokenId, state)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new CoursesApi();
var tokenId = 56; // int | 
var state = true; // bool | 

try { 
    var result = api_instance.coursesUpdateToken(tokenId, state);
    print(result);
} catch (e) {
    print("Exception when calling CoursesApi->coursesUpdateToken: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tokenId** | **int**|  | 
 **state** | **bool**|  | [optional] 

### Return type

[**CourseToken**](CourseToken.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

