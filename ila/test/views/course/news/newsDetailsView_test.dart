import 'package:flutter_test/flutter_test.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/course/news/newsDetailsView.dart';
import 'package:ila_swagger/api.dart';

import '../../../testHelper.dart';

void main() {
  testWidgets('News Details', (WidgetTester tester) async {
    await tester.pumpWidget(TestHelper.buildPage(
      NewsDetailsView(CourseNews.fromJson({
        'title': 'Title1',
        'body': 'This is a text.',
      })),
      AuthModel(),
      IlaApiClient(),
    ));

    final titleFinder = find.text('Title1');
    final bodyFinder = find.text('This is a text.');

    expect(titleFinder, findsOneWidget);
    expect(bodyFinder, findsOneWidget);
  });
}
