import 'package:flutter_test/flutter_test.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/course/lecture/AllQuestionsView.dart';
import 'package:ila_swagger/api.dart';
import 'package:mockito/mockito.dart';

import '../../../testHelper.dart';

void main() {

  Question ques1 =Question.fromJson({
    'pointedQuestion': 'QUESTION',
    'answers': [
      {
        'comment': 'comment1',
      },
      {
        'comment': 'comment2',
      },
    ]
  });
  Question ques2 =Question.fromJson({
    'pointedQuestion': 'QUESTION2',
    'answers': [
      {
        'comment': 'comment12',
      },
      {
        'comment': 'comment22',
      },
    ]
  });
  List<Question> questions = [ques1,ques2];
  MockNavigatorObserver navigation = MockNavigatorObserver();

  testWidgets('AllQuestionsView', (WidgetTester tester) async {
    await tester.pumpWidget(TestHelper.buildPage(
        AllQuestionsView(questions),
        AuthModel(IlaApiClient())));

    final titleFinder = find.text('All Questions');
    final questionFinder = find.text('QUESTION');
    final question2Finder = find.text('QUESTION2');
    final answer1Finder = find.text('comment1');
    final answer2Finder = find.text('comment2');
    final answer12Finder = find.text('comment12');
    final answer22Finder = find.text('comment22');

    expect(titleFinder, findsOneWidget);
    expect(questionFinder, findsOneWidget);
    expect(answer1Finder, findsNothing);
    expect(answer2Finder, findsNothing);
    expect(question2Finder, findsOneWidget);
    expect(answer12Finder, findsNothing);
    expect(answer22Finder, findsNothing);
  });


  testWidgets('AllQuestionsView Navigation', (WidgetTester tester) async {
    await tester.pumpWidget(TestHelper.buildPage(
        AllQuestionsView(questions),
        AuthModel(IlaApiClient()),navigatorObserver: navigation));

    await tester.pump();

    await tester.tap(find.text('QUESTION'));

    await tester.pumpAndSettle();

    verify(navigation.didPush(any, any));
  });
}
