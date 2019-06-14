import 'package:flutter_test/flutter_test.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/course/news/newsView.dart';
import 'package:ila_swagger/api.dart';

import '../../../testHelper.dart';

void main() {
  testWidgets('News Details', (WidgetTester tester) async {
    await tester.pumpWidget(TestHelper.buildPage(
      NewsView([
        CourseNews.fromJson({
          'title': 'Title1',
          'body': 'Short Body',
        }),
        CourseNews.fromJson({
          'title': 'Title2',
          'body': 'Very very very very very very long body.',
        }),
        CourseNews.fromJson({
          'title': 'Title3',
          'body': 'Short Body2',
        })
      ]),
      AuthModel(),
      IlaApiClient(),
    ));

    final titleFinder = find.text('News');

    final news1TitleFinder = find.text("Title1");
    final news2TitleFinder = find.text("Title2");
    final news3TitleFinder = find.text("Title3");
    final news1SubtitleFinder = find.text("Short Body...");
    final news2SubtitleFinder = find.text("Very very very very very very ...");
    final news3SubtitleFinder = find.text("Short Body2...");

    expect(titleFinder, findsOneWidget);
    expect(news1TitleFinder, findsOneWidget);
    expect(news2TitleFinder, findsOneWidget);
    expect(news3TitleFinder, findsOneWidget);
    expect(news1SubtitleFinder, findsOneWidget);
    expect(news2SubtitleFinder, findsOneWidget);
    expect(news3SubtitleFinder, findsOneWidget);
  });
}
