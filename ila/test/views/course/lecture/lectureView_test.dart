import 'package:flutter_test/flutter_test.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/course/lecture/lectureView.dart';
import 'package:ila_swagger/api.dart';

import '../../../testHelper.dart';

void main() {
  group('LectureView', () {
    testWidgets('Texts', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.buildPage(
          LectureView(_LecturesApi(), _QuestionApi(),_ProfQuestionApi(),
              Lecture.fromJson({'id': 1, 'title': 'LectureTitle'})),
          AuthModel(IlaApiClient())));

      final titleFinder = find.text('LectureTitle');

      expect(titleFinder, findsOneWidget);
    });
  });
}

class _LecturesApi extends LecturesApi {}

class _QuestionApi extends QuestionApi {
  Future<List<Question>> questionGetLecture(int id) async {
    return [];
  }
}

class _ProfQuestionApi extends ProfQuestionApi {
  Future<List<ProfQuestion>> profQuestionGet(int lectureId) async {
    return [];
  }
}
