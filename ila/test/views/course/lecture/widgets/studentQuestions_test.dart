import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/course/lecture/widgets/studentQuestions.dart';
import 'package:ila_swagger/api.dart';
import 'package:mockito/mockito.dart';

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

  testWidgets('Questions more then 3', (WidgetTester tester) async {
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

  testWidgets('Questions less then 3', (WidgetTester tester) async {
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

    expect(question1Finder, findsOneWidget);
    expect(question2Finder, findsOneWidget);
  });

  testWidgets('Open Questions', (WidgetTester tester) async {
    await tester.pumpWidget(TestHelper.buildPage(
        StudentQuestions(
            _QuestionApi(),
            Lecture.fromJson({
              'id': 1,
            })),
        AuthModel(IlaApiClient()),
        navigatorObserver: navigation));

    await tester.pump();

    await tester.tap(find.text('Frage1'));
    await tester.pumpAndSettle();

    verify(navigation.didPush(any, any));
  });
}

class _QuestionApi extends QuestionApi {
  Future<List<Question>> questionGetLecture(int id) {
    return Future.value([
      Question.fromJson({
        'id': 1,
        'pointedQuestion': 'Frage1',
        'answers': [
          {
            'comment': 'comment1',
          },
          {
            'comment': 'comment2',
          },
        ]
      }),
      Question.fromJson({
        'id': 2,
        'pointedQuestion': 'Frage2',
        'answers': [
          {
            'comment': 'comment1',
          },
          {
            'comment': 'comment2',
          },
        ]
      }),
      Question.fromJson({
        'id': 3,
        'pointedQuestion': 'Frage3',
        'answers': [
          {
            'comment': 'comment1',
          },
          {
            'comment': 'comment2',
          },
        ]
      }),
      Question.fromJson({
        'id': 4,
        'pointedQuestion': 'Frage4',
        'answers': [
          {
            'comment': 'comment1',
          },
          {
            'comment': 'comment2',
          },
        ]
      }),
    ]);
  }
}
