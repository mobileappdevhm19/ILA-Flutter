import 'package:flutter/material.dart';
import 'package:ila/views/course/lecture/widgets/pauseButton.dart';
import 'package:ila/views/course/lecture/widgets/studentQuestions.dart';
import 'package:ila_swagger/api.dart';

class AskQuestionView extends StatefulWidget {
  Lecture lecture;
  final LecturesApi lecturesApi;

  AskQuestionView(this.lecturesApi, this.lecture);

  @override
  _AskQuestionViewState createState() => _AskQuestionViewState();
}

class _AskQuestionViewState extends State<AskQuestionView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Ask a question'),
      ),
      body: Builder(
        builder: (context) => Container(
              padding: EdgeInsets.only(top: 15),
              child: Column(),
            ),
      ),
    );
  }
}
