import 'package:flutter/material.dart';
import 'package:ila_swagger/api.dart';

class CreateQuestionAnswerView extends StatefulWidget {
  final Question question;
  final LecturesApi lecturesApi;

  const CreateQuestionAnswerView(this.lecturesApi, this.question);

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
      body: Column(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Card(
                child: Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 2.0, vertical: 6.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          widget.question.pointedQuestion,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                  onPressed: () => widget.lecturesApi
                          .lecturesPostAnswer(
                              widget.question.id,
                              AnswerCreate.fromJson(
                                  {'comment': _controller.text}))
                          .then((_) => Navigator.of(context).pop())
                          .catchError((error) {
                        //TODO: handle error
                      }),
                ),
              ]))
            ],
          )
        ],
      ),
    );
  }
}