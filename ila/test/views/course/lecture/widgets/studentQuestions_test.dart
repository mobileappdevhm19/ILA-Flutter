import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/course/lecture/widgets/studentQuestions.dart';
import 'package:ila_swagger/api.dart';

import '../../../../testHelper.dart';

void main() {
  MockNavigatorObserver navigation = MockNavigatorObserver();

  group('Student Questions Widget', () {
    testWidgets('Texts', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.buildPage(
          StudentQuestions(
              _QuestionApi(),
              Lecture.fromJson({
                'id': 1,
              })),
          AuthModel(IlaApiClient())));
      final titleFinder = find.text('Student Questions');
      final titleIconFinder = find.byIcon(Icons.question_answer);
      final askFinder = find.text('Ask a question');
      final allQuestionsFinder = find.text('Show All Questions');

      expect(titleFinder, findsOneWidget);
      expect(titleIconFinder, findsOneWidget);
      expect(askFinder, findsOneWidget);
      expect(allQuestionsFinder, findsOneWidget);
    });
  });

  testWidgets('Questions', (WidgetTester tester) async {
    await tester.pumpWidget(TestHelper.buildPage(
        StudentQuestions(
            _QuestionApi(),
            Lecture.fromJson({
              'id': 1,
            })),
        AuthModel(IlaApiClient())));

    await tester.pump();
    final question1Finder = find.text('Frage1');
    final question2Finder = find.text('Frage2');
    final question3Finder = find.text('Frage3');
    final question4Finder = find.text('Frage4');

    expect(question1Finder, findsOneWidget);
    expect(question2Finder, findsOneWidget);
    expect(question3Finder, findsOneWidget);
    expect(question4Finder, findsNothing);
  });
}

class _QuestionApi extends QuestionApi {
  Future<List<Question>> questionGetLecture(int id) {
    return Future.value([
      Question.fromJson({'pointedQuestion':'Frage1'}),
      Question.fromJson({'pointedQuestion':'Frage2'}),
      Question.fromJson({'pointedQuestion':'Frage3'}),
      Question.fromJson({'pointedQuestion':'Frage4'}),
    ]);
  }
}
