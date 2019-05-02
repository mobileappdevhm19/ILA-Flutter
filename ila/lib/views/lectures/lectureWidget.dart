import 'package:flutter/material.dart';

class LectureWidget extends StatefulWidget {
  Lecture lecture;

  LectureWidget({this.lecture});

  @override
  LectureWidgetState createState() => LectureWidgetState();
}

class LectureWidgetState extends State<LectureWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.lecture.title),
      ),
      body: Center(
        child: Column(children: <Widget>[
          FlatButton(
            child: Icon(
              Icons.block,
              size: 80,
            ),
            onPressed: () => print('Need pause!!!'),
          ),
        ]),
      ),
    );
  }
}

class Lecture {
  String title;

  Lecture({this.title});
}
