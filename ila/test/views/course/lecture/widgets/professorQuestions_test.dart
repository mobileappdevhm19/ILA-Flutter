import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/course/lecture/widgets/professorQuestions.dart';
import 'package:ila/views/course/lecture/widgets/studentQuestions.dart';
import 'package:ila_swagger/api.dart';
import 'package:mockito/mockito.dart';

import '../../../../testHelper.dart';

void main() {
  MockNavigatorObserver navigation = MockNavigatorObserver();

  group('Professor Questions Widget', () {
    testWidgets('Texts', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.buildPage(
          ProfessorQuestions(_ProfQuestionApi(), Lecture.fromJson({'id': 1})),
          AuthModel(IlaApiClient())));
      final titleFinder = find.text('Lecture Questions');
      final titleIconFinder = find.byIcon(Icons.question_answer);
      final allQuestionsFinder = find.text('Show All Professor Questions');

      expect(titleFinder, findsOneWidget);
      expect(titleIconFinder, findsOneWidget);
      expect(allQuestionsFinder, findsOneWidget);
    });
  });

  testWidgets('Questions more then 3', (WidgetTester tester) async {
    await tester.pumpWidget(TestHelper.buildPage(
        ProfessorQuestions(_ProfQuestionApi(), Lecture.fromJson({'id': 1})),
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
        ProfessorQuestions(_ProfQuestionApi(), Lecture.fromJson({'id': 2})),
        AuthModel(IlaApiClient())));

    await tester.pump();
    final question1Finder = find.text('Frage1');
    final question2Finder = find.text('Frage2');
    final question3Finder = find.text('Frage3');
    final question4Finder = find.text('Frage4');

    expect(question1Finder, findsOneWidget);
    expect(question2Finder, findsOneWidget);
    expect(question3Finder, findsNothing);
    expect(question4Finder, findsNothing);
  });

  testWidgets('Open Questions', (WidgetTester tester) async {
    await tester.pumpWidget(TestHelper.buildPage(
        ProfessorQuestions(_ProfQuestionApi(), Lecture.fromJson({'id': 1})),
        AuthModel(IlaApiClient()),
        navigatorObserver: navigation));

    await tester.pump();

    await tester.tap(find.text('Frage1'));
    await tester.pumpAndSettle();

    verify(navigation.didPush(any, any));
  });
}

class _ProfQuestionApi extends ProfQuestionApi {
  ProfQuestion frage1 = ProfQuestion.fromJson({
    'id': 1,
    'question': 'Frage1',
    'answers': [
      {
        'answer': 'comment1',
      },
      {
        'answer': 'comment2',
      },
    ]
  });
  ProfQuestion frage2 = ProfQuestion.fromJson({
    'id': 2,
    'question': 'Frage2',
    'answers': [
      {
        'answer': 'comment1',
      },
      {
        'answer': 'comment2',
      },
    ]
  });
  ProfQuestion frage3 = ProfQuestion.fromJson({
    'id': 3,
    'question': 'Frage3',
    'answers': [
      {
        'answer': 'comment1',
      },
      {
        'answer': 'comment2',
      },
    ]
  });
  ProfQuestion frage4 = ProfQuestion.fromJson({
    'id': 4,
    'question': 'Frage4',
    'answers': [
      {
        'answer': 'comment1',
      },
      {
        'answer': 'comment2',
      },
    ]
  });

  Future<List<ProfQuestion>> profQuestionGet(int lectureId) async {
    if (lectureId == 1)
      return Future.value([frage1, frage2, frage3, frage4]);
    else if (lectureId == 2)
      return Future.value([frage1, frage2]);
    return [];
  }
}
