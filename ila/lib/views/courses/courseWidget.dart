import 'package:flutter/material.dart';
import 'package:ila/views/courses/coursesWidget.dart';

class CourseWidget extends StatefulWidget {
  final Course course;

  CourseWidget({this.course, Key key}) : super(key: key);

  @override
  CourseWidgetState createState() => CourseWidgetState();
}

class CourseWidgetState extends State<CourseWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.widget.course.title),),
      body: Text(this.widget.course.title),
    );
  }
}