import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ila/config.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/course/addCourseView.dart';
import 'package:ila/views/homeView.dart';
import 'package:ila_swagger/api.dart';
import 'package:mockito/mockito.dart';

import '../testHelper.dart';

void main() {
  group('HomeView', () {
    testWidgets('Texts', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.buildPage(
          HomeView(_CourseApiMock(false)), AuthModel(IlaApiClient())));

      await tester.pump();

      final subtitleFinder = find.text("Courses");
      final titleFinder = find.text("ILA");
      final settingsFinder = find.byIcon(Icons.settings);
      final addFinder = find.byIcon(Icons.add);
      final title1Finder = find.text("Title1");
      final title2Finder = find.text("Title2");

      expect(subtitleFinder, findsOneWidget);
      expect(titleFinder, findsOneWidget);
      expect(settingsFinder, findsOneWidget);
      expect(addFinder, findsOneWidget);
      expect(title1Finder, findsOneWidget);
      expect(title2Finder, findsOneWidget);
    });

    testWidgets('Navigate add Course', (WidgetTester tester) async {
      MockNavigatorObserver navigation = MockNavigatorObserver();
      await tester.pumpWidget(TestHelper.buildPage(
          HomeView(_CourseApiMock(false)), AuthModel(IlaApiClient()),
          navigatorObserver: navigation));

      await tester.pump();

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      verify(navigation.didPush(any, any));
      expect(find.byType(AddCourseView), findsOneWidget);
    });
  });
}

class _CourseApiMock extends CoursesApi {
  final bool error;

  _CourseApiMock(this.error);

  Future<List<Course>> coursesGetAll() async {
    if (!error)
      return await Future.value([
        Course.fromJson({'title': 'Title1'}),
        Course.fromJson({'title': 'Title2'}),
      ]);
    throw 'ERROR';
  }
}
