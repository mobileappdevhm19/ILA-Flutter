import 'package:flutter/material.dart';
import 'package:ila_swagger/api.dart';

class CreateQuestionView extends StatefulWidget {
  final Lecture lecture;
  final LecturesApi lecturesApi;

  const CreateQuestionView(this.lecturesApi, this.lecture);

  @override
  _CreateQuestionViewState createState() => _CreateQuestionViewState();
}

class _CreateQuestionViewState extends State<CreateQuestionView> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Question')),
      body: Column(
        children: <Widget>[
          ListView(
            children: <Widget>[
              TextField(
                  //maxLines: 20,
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
                          .lecturesPostQuestion(
                              widget.lecture.id,
                              QuestionCreate.fromJson(
                                  {'pointedQuestion': _controller.text}))
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
