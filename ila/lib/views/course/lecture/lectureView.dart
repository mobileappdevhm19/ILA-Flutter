import 'package:flutter/material.dart';
import 'package:ila/views/course/lecture/widgets/pauseButton.dart';
import 'package:ila/views/course/lecture/widgets/studentQuestions.dart';
import 'package:ila/views/course/lecture/widgets/professorQuestions.dart';
import 'package:ila_swagger/api.dart';

class LectureView extends StatefulWidget {
  Lecture lecture;
  final LecturesApi lecturesApi;
  final QuestionApi questionApi;
  final ProfQuestionApi profQuestionApi;

  LectureView(
      this.lecturesApi, this.questionApi, this.profQuestionApi, this.lecture);

  @override
  _LectureViewState createState() => _LectureViewState();
}

class _LectureViewState extends State<LectureView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lecture.title),
      ),
      body: Builder(
        builder: (context) => Container(
              padding: EdgeInsets.only(top: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        PauseButton(widget.lecturesApi, widget.lecture.id),
                        ProfessorQuestions(
                            widget.profQuestionApi, widget.lecture),
                        StudentQuestions(widget.questionApi, widget.lecture),
                      ],
                    )
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
