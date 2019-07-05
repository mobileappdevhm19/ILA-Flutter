import 'package:flutter/material.dart';
import 'package:ila/widgets/ilaToast.dart';
import 'package:ila_swagger/api.dart';

class CreateQuestionAnswerView extends StatefulWidget {
  final Question question;
  final QuestionApi questionApi;

  const CreateQuestionAnswerView(this.questionApi, this.question);

  @override
  _CreateQuestionAnswerViewState createState() =>
      _CreateQuestionAnswerViewState();
}

class _CreateQuestionAnswerViewState extends State<CreateQuestionAnswerView> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Answer Question')),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          TextField(
              maxLines: 20,
              autofocus: true,
              controller: _controller,
              textInputAction: TextInputAction.send,
              decoration: InputDecoration(border: OutlineInputBorder())),
          ButtonTheme.bar(
              // make buttons use the appropriate styles for cards
              child: ButtonBar(children: <Widget>[
            FlatButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: const Text('Post answer'),
              //Example for Posting to API via inline generated JSON
              onPressed: () => widget.questionApi
                      .questionPostAnswer(widget.question.id,
                          AnswerCreate.fromJson({'comment': _controller.text}))
                      .then((_) {
                    Navigator.of(context).pop();
                    ILAToast.of(context).showToast(
                      toastType: ToastType.success,
                      message: 'Antwort wurde gespeichert',
                    );
                  }).catchError((error) {
                    ILAToast.of(context).showToast(
                      toastType: ToastType.error,
                      message: error is ApiException
                          ? (error as ApiException).message
                          : 'Unbekannter Fehler ist aufgetretten',
                    );
                  }),
            ),
          ]))
        ],
      )),
    );
  }
}
