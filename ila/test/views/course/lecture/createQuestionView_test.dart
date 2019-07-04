import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ila/config.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/course/lecture/createQuestionView.dart';
import 'package:ila_swagger/api.dart';

import '../../../testHelper.dart';

void main() {
  MockNavigatorObserver navigation = MockNavigatorObserver();

  group('Student Questions Create View ', () {
    testWidgets('Texts', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.buildPage(
          CreateQuestionView(
              _QuestionApi(),
              Lecture.fromJson({
                'id': 1,
              })),
          AuthModel(IlaApiClient())));
      final titleFinder = find.text('Create Question');
      final cancelFinder = find.text('Cancel');
      final postFinder = find.text('Post question');

      expect(titleFinder, findsOneWidget);
      expect(cancelFinder, findsOneWidget);
      expect(postFinder, findsOneWidget);
    });

    testWidgets('Post', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.buildPage(
          CreateQuestionView(
              _QuestionApi(),
              Lecture.fromJson({
                'id': 1,
              })),
          AuthModel(IlaApiClient()),
          navigatorObserver: navigation));

      await tester.pump();
      await tester.enterText(find.byType(TextField).at(0), 'Frage');
      await tester.tap(find.text('Post question'));

      await tester.pumpAndSettle();
      expect(find.text('Frage wurde gespeichert'), findsOneWidget);
      await tester.pumpAndSettle(Duration(seconds: Config.ToastDuration));
    });

    testWidgets('Post API error', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.buildPage(
          CreateQuestionView(
              _QuestionApi(),
              Lecture.fromJson({
                'id': 1,
              })),
          AuthModel(IlaApiClient()),
          navigatorObserver: navigation));

      await tester.pump();
      await tester.enterText(find.byType(TextField).at(0), 'falsche Frage');
      await tester.tap(find.text('Post question'));

      await tester.pumpAndSettle();
      expect(find.text('Fehler'), findsOneWidget);
      await tester.pumpAndSettle(Duration(seconds: Config.ToastDuration));
    });

    testWidgets('Post unknown error', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.buildPage(
          CreateQuestionView(
              _QuestionApi(),
              Lecture.fromJson({
                'id': 2,
              })),
          AuthModel(IlaApiClient()),
          navigatorObserver: navigation));

      await tester.pump();
      await tester.enterText(find.byType(TextField).at(0), 'Frage');
      await tester.tap(find.text('Post question'));

      await tester.pumpAndSettle();
      expect(find.text('Unbekannter Fehler ist aufgetretten'), findsOneWidget);
      await tester.pumpAndSettle(Duration(seconds: Config.ToastDuration));
    });
  });
}

class _QuestionApi extends QuestionApi {
  Future<Question> questionPostQuestion(
      int lectureId, QuestionCreate model) async {
    if (lectureId == 1 && model.pointedQuestion == 'Frage') {
      return null;
    } else if (lectureId == 1) {
      throw ApiException(400, 'Fehler');
    } else {
      throw 'ABC';
    }
  }
}
