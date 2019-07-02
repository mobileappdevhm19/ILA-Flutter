# ila_swagger.model.Lecture

## Load the model package
```dart
import 'package:ila_swagger/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** |  | [default to null]
**title** | **String** |  | [default to null]
**description** | **String** |  | [optional] [default to null]
**visible** | **bool** |  | [default to null]
**start** | [**DateTime**](DateTime.md) |  | [default to null]
**stop** | [**DateTime**](DateTime.md) |  | [default to null]
**courseId** | **int** |  | [default to null]
**course** | [**Course**](Course.md) |  | [optional] [default to null]
**pauses** | [**List&lt;Pause&gt;**](Pause.md) |  | [optional] [default to []]
**questions** | [**List&lt;Question&gt;**](Question.md) |  | [optional] [default to []]
**profQuestions** | [**List&lt;ProfQuestion&gt;**](ProfQuestion.md) |  | [optional] [default to []]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


