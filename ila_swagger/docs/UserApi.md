# ila_swagger.api.UserApi

## Load the API package
```dart
import 'package:ila_swagger/api.dart';
```

All URIs are relative to *https://ila.dev.kirschbaum.bayern*

Method | HTTP request | Description
------------- | ------------- | -------------
[**userDeleteToken**](UserApi.md#userDeleteToken) | **DELETE** /api/User/token | 
[**userPostToken**](UserApi.md#userPostToken) | **POST** /api/User/token | 
[**userTestPush**](UserApi.md#userTestPush) | **GET** /api/User/pushTest | 


# **userDeleteToken**
> MultipartFile userDeleteToken(deviceId)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new UserApi();
var deviceId = deviceId_example; // String | 

try { 
    var result = api_instance.userDeleteToken(deviceId);
    print(result);
} catch (e) {
    print("Exception when calling UserApi->userDeleteToken: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **String**|  | [optional] 

### Return type

[**MultipartFile**](File.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userPostToken**
> PushTokens userPostToken(model)



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new UserApi();
var model = new SavePushToken(); // SavePushToken | 

try { 
    var result = api_instance.userPostToken(model);
    print(result);
} catch (e) {
    print("Exception when calling UserApi->userPostToken: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **model** | [**SavePushToken**](SavePushToken.md)|  | 

### Return type

[**PushTokens**](PushTokens.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userTestPush**
> TestPush userTestPush()



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new UserApi();

try { 
    var result = api_instance.userTestPush();
    print(result);
} catch (e) {
    print("Exception when calling UserApi->userTestPush: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**TestPush**](TestPush.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

