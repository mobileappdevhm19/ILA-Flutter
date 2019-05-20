# ila_swagger.api.AccountApi

## Load the API package
```dart
import 'package:ila_swagger/api.dart';
```

All URIs are relative to *https://ila.dev.kirschbaum.bayern*

Method | HTTP request | Description
------------- | ------------- | -------------
[**accountLogout**](AccountApi.md#accountLogout) | **POST** /api/Account/logout | 
[**accountSignIn**](AccountApi.md#accountSignIn) | **POST** /api/Account/login | 
[**accountSignUp**](AccountApi.md#accountSignUp) | **POST** /api/Account/signup | 


# **accountLogout**
> MultipartFile accountLogout()



### Example 
```dart
import 'package:ila_swagger/api.dart';
// TODO Configure API key authorization: JWT
//ila_swagger.api.Configuration.apiKey{'Authorization'} = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//ila_swagger.api.Configuration.apiKeyPrefix{'Authorization'} = "Bearer";

var api_instance = new AccountApi();

try { 
    var result = api_instance.accountLogout();
    print(result);
} catch (e) {
    print("Exception when calling AccountApi->accountLogout: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**MultipartFile**](File.md)

### Authorization

[JWT](../README.md#JWT)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountSignIn**
> JsonWebToken accountSignIn(request)



### Example 
```dart
import 'package:ila_swagger/api.dart';

var api_instance = new AccountApi();
var request = new SignIn(); // SignIn | 

try { 
    var result = api_instance.accountSignIn(request);
    print(result);
} catch (e) {
    print("Exception when calling AccountApi->accountSignIn: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**SignIn**](SignIn.md)|  | 

### Return type

[**JsonWebToken**](JsonWebToken.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountSignUp**
> MultipartFile accountSignUp(request)



### Example 
```dart
import 'package:ila_swagger/api.dart';

var api_instance = new AccountApi();
var request = new SignUp(); // SignUp | 

try { 
    var result = api_instance.accountSignUp(request);
    print(result);
} catch (e) {
    print("Exception when calling AccountApi->accountSignUp: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**SignUp**](SignUp.md)|  | 

### Return type

[**MultipartFile**](File.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

