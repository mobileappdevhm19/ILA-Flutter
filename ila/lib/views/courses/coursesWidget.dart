import 'package:flutter/material.dart';
import 'package:ila/views/courses/courseWidget.dart';
import 'package:ila/views/lectures/lectureWidget.dart';

class CoursesWidget extends StatelessWidget {
  final List<Course> items = [
    Course(
        title: 'Mobile App Development',
        description: 'Flutter Apps',
        lectures: [
          Lecture(title: 'Lecture 1'),
          Lecture(title: 'Lecture 2'),
          Lecture(title: 'Lecture 3'),
          Lecture(title: 'Lecture 4')
        ]),
    Course(
        title: 'Signal Processing',
        description: 'Digital Signal Systems',
        lectures: [
          Lecture(title: 'Lecture 1'),
          Lecture(title: 'Lecture 2'),
          Lecture(title: 'Lecture 3'),
          Lecture(title: 'Lecture 4')
        ]),
    Course(
        title: 'Autonomous Systems',
        description: 'Indoor Navigation',
        lectures: [
          Lecture(title: 'Lecture 1'),
          Lecture(title: 'Lecture 2'),
          Lecture(title: 'Lecture 3'),
          Lecture(title: 'Lecture 4')
        ]),
    Course(
        title: 'Multisensor Navigation',
        description: 'Navigation Algorithmen',
        lectures: [
          Lecture(title: 'Lecture 1'),
          Lecture(title: 'Lecture 2'),
          Lecture(title: 'Lecture 3'),
          Lecture(title: 'Lecture 4')
        ])
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // Let the ListView know how many items it needs to build
      itemCount: items.length,
      // Provide a builder function. This is where the magic happens! We'll
      // convert each item into a Widget based on the type of item it is.
      itemBuilder: (context, index) {
        final item = items[index];

        return ListTile(
          title: Text(item.title),
          subtitle: Text(item.description),
          onTap: () => onTapped(context, item),
        );
      },
    );
  }

  onTapped(BuildContext context, Course course) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => CourseWidget(course: course)));
  }
}

class Course {
  String title, description;
  List<Lecture> lectures;

  Course({this.title, this.description, this.lectures});
}
