import 'package:flutter_test/flutter_test.dart';
import 'package:ila/helpers/routes.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/course/lecture/AllProfQuestionsView.dart';
import 'package:ila/views/course/lecture/AllQuestionsView.dart';
import 'package:ila_swagger/api.dart';
import 'package:mockito/mockito.dart';

import '../../../testHelper.dart';

void main() {
  MockNavigatorObserver navigation = MockNavigatorObserver();

  testWidgets('AllQuestionsView', (WidgetTester tester) async {
    await tester.pumpWidget(TestHelper.buildPage(
        AllProfQuestionsView(Lecture.fromJson({'id': 1}), _ProfQuestionApi()),
        AuthModel(IlaApiClient())));
    await tester.pump();

    final titleFinder = find.text('All Professor Questions');
    final question1Finder = find.text('title1');
    final question2Finder = find.text('title2');
    final question1SubFinder = find.text('QUESTION1...');
    final question2SubFinder = find.text('QUESTION2 QUESTION2 QUESTION2 ...');

    expect(titleFinder, findsOneWidget);
    expect(question1Finder, findsOneWidget);
    expect(question2Finder, findsOneWidget);
    expect(question1SubFinder, findsOneWidget);
    expect(question2SubFinder, findsOneWidget);
  });

  testWidgets('AllQuestionsView', (WidgetTester tester) async {
    profQuestionApi = _ProfQuestionApi();
    await tester.pumpWidget(TestHelper.buildPage(
        AllProfQuestionsView(Lecture.fromJson({'id': 1}), _ProfQuestionApi()),
        AuthModel(IlaApiClient()),
        navigatorObserver: navigation));

    await tester.pump();

    await tester.tap(find.text('title1'));

    await tester.pumpAndSettle();

    verify(navigation.didPush(any, any));
  });
}

class _ProfQuestionApi extends ProfQuestionApi {
  ProfQuestion ques1 = ProfQuestion.fromJson({
    'question': 'QUESTION1',
    'title': 'title1',
    'answers': [
      {
        'id': 1,
        'answer': 'comment1',
      },
      {
        'id': 2,
        'answer': 'comment2',
      },
    ]
  });
  ProfQuestion ques2 = ProfQuestion.fromJson({
    'question': 'QUESTION2 QUESTION2 QUESTION2 QUESTION2',
    'title': 'title2',
    'answers': [
      {
        'answer': 'answer1',
      },
      {
        'answer': 'answer2',
      },
    ]
  });

  Future<List<ProfQuestion>> profQuestionGet(int lectureId) async {
    return [ques1, ques2];
  }
}
