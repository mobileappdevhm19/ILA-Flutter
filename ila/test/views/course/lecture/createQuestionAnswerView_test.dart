import 'package:flutter_test/flutter_test.dart';
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
  });
}

class _QuestionApi extends QuestionApi {}
