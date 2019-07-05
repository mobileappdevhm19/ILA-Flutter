import 'package:flutter_test/flutter_test.dart';
import 'package:ila/config.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/course/lecture/profQuestionView.dart';
import 'package:ila_swagger/api.dart';

import '../../../testHelper.dart';

void main() {
  MockNavigatorObserver navigation = MockNavigatorObserver();
  group('Professor Question View', () {
    testWidgets('QuestionView', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.buildPage(
          ProfQuestionView(
              ProfQuestion.fromJson({
                'id': 1,
                'title': 'title',
                'question': 'question1',
                'answers': [
                  {
                    'id': 1,
                    'answer': 'answer1',
                  },
                  {
                    'id': 2,
                    'answer': 'answer2',
                  },
                ]
              }),
              _ProfQuestionApi()),
          AuthModel(IlaApiClient())));

      final titleFinder = find.text('Professor Question');
      final answerChoicesFinder = find.text('Answer Choices');
      final questionFinder = find.text('question1');
      final answer1Finder = find.text('answer1');
      final answer2Finder = find.text('answer2');

      expect(titleFinder, findsNWidgets(2));
      expect(answerChoicesFinder, findsOneWidget);
      expect(questionFinder, findsOneWidget);
      expect(answer1Finder, findsOneWidget);
      expect(answer2Finder, findsOneWidget);
    });

    testWidgets('Tap Answer', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.buildPage(
          ProfQuestionView(
              ProfQuestion.fromJson({
                'id': 1,
                'title': 'title',
                'question': 'question1',
                'answers': [
                  {
                    'id': 1,
                    'answer': 'answer1',
                  },
                  {
                    'id': 2,
                    'answer': 'answer2',
                  },
                ]
              }),
              _ProfQuestionApi()),
          AuthModel(IlaApiClient())));

      await tester.pump();
      await tester.tap(find.text('answer1'));
      await tester.pumpAndSettle();
      expect(find.text('You pushed answer1'), findsOneWidget);
      await tester.pumpAndSettle(Duration(seconds: Config.ToastDuration));
    });

    testWidgets('Tap Answer ApiException', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.buildPage(
          ProfQuestionView(
              ProfQuestion.fromJson({
                'id': 1,
                'title': 'title',
                'question': 'question1',
                'answers': [
                  {
                    'id': 3,
                    'answer': 'answer1',
                  },
                  {
                    'id': 2,
                    'answer': 'answer2',
                  },
                ]
              }),
              _ProfQuestionApi()),
          AuthModel(IlaApiClient())));

      await tester.pump();
      await tester.tap(find.text('answer1'));
      await tester.pumpAndSettle();
      expect(find.text('API ERROR'), findsOneWidget);
      await tester.pumpAndSettle(Duration(seconds: Config.ToastDuration));
    });

    testWidgets('Tap Answer unkownException', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.buildPage(
          ProfQuestionView(
              ProfQuestion.fromJson({
                'id': 1,
                'title': 'title',
                'question': 'question1',
                'answers': [
                  {
                    'id': 2,
                    'answer': 'answer1',
                  },
                  {
                    'id': 1,
                    'answer': 'answer2',
                  },
                ]
              }),
              _ProfQuestionApi()),
          AuthModel(IlaApiClient())));

      await tester.pump();
      await tester.tap(find.text('answer1'));
      await tester.pumpAndSettle();
      expect(find.text('Unbekannter Fehler ist aufgetretten'), findsOneWidget);
      await tester.pumpAndSettle(Duration(seconds: Config.ToastDuration));
    });
  });
}

class _ProfQuestionApi extends ProfQuestionApi {
  Future<ProfQuestionAnswer> profQuestionAnswer(int answerId) async {
    switch(answerId){
      case 2:
        throw "ABC";
      case 3:
        throw ApiException(500, "API ERROR");
    }
    return null;
  }
}
