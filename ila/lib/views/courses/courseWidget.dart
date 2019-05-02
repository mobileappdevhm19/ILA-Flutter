import 'package:flutter/material.dart';
import 'package:ila/views/courses/coursesWidget.dart';
import 'package:ila/views/lectures/lectureWidget.dart';

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
      body: ListView.builder(// Let the ListView know how many items it needs to build
        itemCount: widget.course.lectures.length,
        // Provide a builder function. This is where the magic happens! We'll
        // convert each item into a Widget based on the type of item it is.
        itemBuilder: (context, index) {
          final item = widget.course.lectures[index];

          return ListTile(
            title: Text(item.title),
            onTap: () => onTapped(context, item),
          );
        },),
    );
  }
  onTapped(BuildContext context, Lecture lecture) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LectureWidget(lecture: lecture)));
  }
}