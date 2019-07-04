import 'package:flutter_test/flutter_test.dart';
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
  });

  /*testWidgets('Questions', (WidgetTester tester) async {
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
  });*/
}

class _QuestionApi extends QuestionApi {}
