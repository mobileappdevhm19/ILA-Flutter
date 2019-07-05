import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ila/config.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/course/lecture/createQuestionAnswerView.dart';
import 'package:ila_swagger/api.dart';

import '../../../testHelper.dart';

void main() {
  MockNavigatorObserver navigation = MockNavigatorObserver();

  group('Student Question Answers Create View ', () {
    testWidgets('Texts', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.buildPage(
          CreateQuestionAnswerView(
              _QuestionApi(),
              Question.fromJson({
                'id': 1,
              })),
          AuthModel(IlaApiClient())));
      final titleFinder = find.text('Answer Question');
      final cancelFinder = find.text('Cancel');
      final postFinder = find.text('Post answer');

      expect(titleFinder, findsOneWidget);
      expect(cancelFinder, findsOneWidget);
      expect(postFinder, findsOneWidget);
    });

    testWidgets('Post', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.buildPage(
          CreateQuestionAnswerView(
              _QuestionApi(),
              Question.fromJson({
                'id': 1,
              })),
          AuthModel(IlaApiClient()),
          navigatorObserver: navigation));

      await tester.pump();
      await tester.enterText(find.byType(TextField).at(0), 'Antwort');
      await tester.tap(find.text('Post answer'));

      await tester.pumpAndSettle();
      expect(find.text('Antwort wurde gespeichert'), findsOneWidget);
      await tester.pumpAndSettle(Duration(seconds: Config.ToastDuration));
    });

    testWidgets('Post API error', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.buildPage(
          CreateQuestionAnswerView(
              _QuestionApi(),
              Question.fromJson({
                'id': 1,
              })),
          AuthModel(IlaApiClient()),
          navigatorObserver: navigation));

      await tester.pump();
      await tester.enterText(find.byType(TextField).at(0), 'falsche Antwort');
      await tester.tap(find.text('Post answer'));

      await tester.pumpAndSettle();
      expect(find.text('Fehler'), findsOneWidget);
      await tester.pumpAndSettle(Duration(seconds: Config.ToastDuration));
    });

    testWidgets('Post unknown error', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.buildPage(
          CreateQuestionAnswerView(
              _QuestionApi(),
              Question.fromJson({
                'id': 2,
              })),
          AuthModel(IlaApiClient()),
          navigatorObserver: navigation));

      await tester.pump();
      await tester.enterText(find.byType(TextField).at(0), 'Antwort');
      await tester.tap(find.text('Post answer'));

      await tester.pumpAndSettle();
      expect(find.text('Unbekannter Fehler ist aufgetretten'), findsOneWidget);
      await tester.pumpAndSettle(Duration(seconds: Config.ToastDuration));
    });
  });
}

class _QuestionApi extends QuestionApi {
  Future<Answer> questionPostAnswer(int questionId, AnswerCreate model) async {
    if (questionId == 1 && model.comment == 'Antwort') {
      return null;
    } else if (questionId == 1) {
      throw ApiException(400, 'Fehler');
    } else {
      throw 'ABC';
    }
  }
}
