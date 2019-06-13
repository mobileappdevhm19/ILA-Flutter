import 'package:flutter_test/flutter_test.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/course/lecture/questionView.dart';
import 'package:ila_swagger/api.dart';
import 'package:mockito/mockito.dart';

import '../../../testHelper.dart';

void main() {
  MockNavigatorObserver navigation = MockNavigatorObserver();

  testWidgets('QuestionView', (WidgetTester tester) async {
    await tester.pumpWidget(TestHelper.buildPage(
        QuestionView(Question.fromJson({
          'pointedQuestion': 'QUESTION',
          'answers': [
            {
              'comment': 'comment1',
            },
            {
              'comment': 'comment2',
            },
          ]
        })),
        AuthModel(IlaApiClient())));

    final titleFinder = find.text('Student Question');
    final questionFinder = find.text('QUESTION');
    final answer1Finder = find.text('comment1');
    final answer2Finder = find.text('comment2');

    expect(titleFinder, findsOneWidget);
    expect(questionFinder, findsOneWidget);
    expect(answer1Finder, findsOneWidget);
    expect(answer2Finder, findsOneWidget);
  });


  testWidgets('QuestionView Navigation', (WidgetTester tester) async {
    await tester.pumpWidget(TestHelper.buildPage(
        QuestionView(Question.fromJson({
          'pointedQuestion': 'QUESTION',
          'answers': [
            {
              'comment': 'comment1',
            },
            {
              'comment': 'comment2',
            },
          ]
        })),
        AuthModel(IlaApiClient()),navigatorObserver: navigation));

    await tester.pump();

    await tester.tap(find.text('comment1'));

    await tester.pumpAndSettle();

    verify(navigation.didPush(any, any));
  });
}
