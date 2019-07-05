# ila_swagger.model.Course

## Load the model package
```dart
import 'package:ila_swagger/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** |  | [default to null]
**title** | **String** |  | [default to null]
**description** | **String** |  | [default to null]
**archived** | **bool** |  | [default to null]
**owner** | [**ILAUser**](ILAUser.md) |  | [optional] [default to null]
**members** | [**List&lt;CourseMember&gt;**](CourseMember.md) |  | [optional] [default to []]
**lectures** | [**List&lt;Lecture&gt;**](Lecture.md) |  | [optional] [default to []]
**tokens** | [**List&lt;CourseToken&gt;**](CourseToken.md) |  | [optional] [default to []]
**news** | [**List&lt;CourseNews&gt;**](CourseNews.md) |  | [optional] [default to []]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


