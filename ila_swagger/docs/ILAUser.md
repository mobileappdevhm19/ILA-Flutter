# ila_swagger.model.ILAUser

## Load the model package
```dart
import 'package:ila_swagger/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] [default to null]
**userName** | **String** |  | [optional] [default to null]
**normalizedUserName** | **String** |  | [optional] [default to null]
**email** | **String** |  | [optional] [default to null]
**normalizedEmail** | **String** |  | [optional] [default to null]
**emailConfirmed** | **bool** |  | [default to null]
**passwordHash** | **String** |  | [optional] [default to null]
**securityStamp** | **String** |  | [optional] [default to null]
**concurrencyStamp** | **String** |  | [optional] [default to null]
**phoneNumber** | **String** |  | [optional] [default to null]
**phoneNumberConfirmed** | **bool** |  | [default to null]
**twoFactorEnabled** | **bool** |  | [default to null]
**lockoutEnd** | [**DateTime**](DateTime.md) |  | [optional] [default to null]
**lockoutEnabled** | **bool** |  | [default to null]
**accessFailedCount** | **int** |  | [default to null]
**firstName** | **String** |  | [optional] [default to null]
**lastName** | **String** |  | [optional] [default to null]
**myCourses** | [**List&lt;Course&gt;**](Course.md) |  | [optional] [default to []]
**memberCourses** | [**List&lt;CourseMember&gt;**](CourseMember.md) |  | [optional] [default to []]
**pauses** | [**List&lt;Pause&gt;**](Pause.md) |  | [optional] [default to []]
**questions** | [**List&lt;Question&gt;**](Question.md) |  | [optional] [default to []]
**profAnswers** | [**List&lt;ProfQuestionAnswer&gt;**](ProfQuestionAnswer.md) |  | [optional] [default to []]
**answers** | [**List&lt;Answer&gt;**](Answer.md) |  | [optional] [default to []]
**pushTokens** | [**List&lt;PushTokens&gt;**](PushTokens.md) |  | [optional] [default to []]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


