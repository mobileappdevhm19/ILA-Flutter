import 'package:flutter/material.dart';
import 'package:ila/main.dart';
import 'package:ila_swagger/api.dart';

class CreateQuestionAnswerView extends StatefulWidget {
  final Question question;

  const CreateQuestionAnswerView(this.question);

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
              child: const Text('Post question'),
              //Example for Posting to API via inline generated JSON
              onPressed: () => lecturesApi
                      .lecturesPostAnswer(widget.question.id,
                          AnswerCreate.fromJson({'comment': _controller.text}))
                      .then((_) => Navigator.of(context).pop())
                      .catchError((error) {
                    //TODO: handle error
                  }),
            ),
          ]))
        ],
      )),
    );
  }
}
