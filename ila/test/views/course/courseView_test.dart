import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ila/main.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/course/courseView.dart';
import 'package:ila/views/homeView.dart';
import 'package:ila_swagger/api.dart';

import '../../testHelper.dart';

void main() {
  testWidgets('CourseView', (WidgetTester tester) async {
    coursesApi = _CourseApiMock();
    lecturesApi = _LecturesApiMock();

    await tester.pumpWidget(TestHelper.buildPage(
        CourseView(Course.fromJson(
            {'title': 'CourseTitle1', 'description': 'abc', 'id': 0})),
        AuthModel(IlaApiClient())));

    await tester.pump();

    final titleFinder = find.text("CourseTitle1");
    final subtitle1 = find.text("News");
    final subtitle2 = find.text("Lectures");
    final allNewsFinder = find.text("Show all news");

    final news1TitleFinder = find.text("Title1");
    final news2TitleFinder = find.text("Title2");
    final news1SubtitleFinder = find.text("Short Body...");
    final news2SubtitleFinder = find.text("Very very very very very very ...");

    final lectureTitleFinder = find.text("Lecture Title1");

    expect(titleFinder, findsOneWidget);
    expect(subtitle1, findsOneWidget);
    expect(subtitle2, findsOneWidget);
    expect(allNewsFinder, findsOneWidget);
    expect(news1TitleFinder, findsOneWidget);
    expect(news2TitleFinder, findsOneWidget);
    expect(news1SubtitleFinder, findsOneWidget);
    expect(news2SubtitleFinder, findsOneWidget);
    expect(lectureTitleFinder, findsOneWidget);
  });
}

class _CourseApiMock extends CoursesApi {
  Future<List<Course>> coursesGetAll() async {
    return Future.value([
      Course.fromJson({
        'title': 'Title1',
        'description': 'abc1',
      }),
      Course.fromJson({
        'title': 'Title2',
        'description': 'abc2',
      }),
    ]);
  }

  Future<Course> coursesGet(int id) async {
    if (id == 0)
      return Future.value(Course.fromJson({
        'description': 'abc',
        'title': 'CourseTitle1',
        'news': [
          {
            'title': 'Title1',
            'body': 'Short Body',
          },
          {
            'title': 'Title2',
            'body': 'Very very very very very very long body',
          },
          {
            'title': 'Title1',
            'body': 'Short Body2',
          }
        ]
      }));
    return null;
  }
}

class _LecturesApiMock extends LecturesApi {
  Future<List<Lecture>> lecturesGetAll(int courseId) async {
    if (courseId == 0) {
      return Future.value([
        Lecture.fromJson({'title': 'Lecture Title1'}),
        Lecture.fromJson({'title': 'Lecture Title2'}),
      ]);
    }
  }
}
