import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ila/config.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/course/lecture/widgets/pauseButton.dart';
import 'package:ila_swagger/api.dart';

import '../../../../testHelper.dart';

void main() {
  group('Pause Button', () {
    testWidgets('Texts', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.buildPage(
          PauseButton(_LecturesApi(), 1), AuthModel(IlaApiClient())));

      final titleFinder = find.text('Pause');
      final titleIconFinder = find.byIcon(Icons.announcement);

      expect(titleFinder, findsOneWidget);
      expect(titleIconFinder, findsOneWidget);
    });

    testWidgets('Press Pause', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.buildPage(
          PauseButton(_LecturesApi(), 1), AuthModel(IlaApiClient())));

      await tester.pump();
      await tester.tap(find.text('Pause'));

      await tester.pumpAndSettle();
      expect(find.text('pause send'), findsOneWidget);
      await tester.pumpAndSettle(Duration(seconds: Config.ToastDuration));
    });
    testWidgets('Press Pause within 2 minutes', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.buildPage(
          PauseButton(_LecturesApi(), 3), AuthModel(IlaApiClient())));

      await tester.pump();
      await tester.tap(find.text('Pause'));

      await tester.pumpAndSettle();
      expect(find.text('you have to wait 2 min'), findsOneWidget);
      await tester.pumpAndSettle(Duration(seconds: Config.ToastDuration));
    });
    testWidgets('Press Pause ApiError', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.buildPage(
          PauseButton(_LecturesApi(), 2), AuthModel(IlaApiClient())));

      await tester.pump();
      await tester.tap(find.text('Pause'));

      await tester.pumpAndSettle();
      expect(find.text('Error Message'), findsOneWidget);
      await tester.pumpAndSettle(Duration(seconds: Config.ToastDuration));
    });
    testWidgets('Press Pause unkown error', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.buildPage(
          PauseButton(_LecturesApi(), 5), AuthModel(IlaApiClient())));

      await tester.pump();
      await tester.tap(find.text('Pause'));

      await tester.pumpAndSettle();
      expect(find.text('Unbekannter Fehler ist aufgetretten'), findsOneWidget);
      await tester.pumpAndSettle(Duration(seconds: Config.ToastDuration));
    });
  });
}

class _LecturesApi extends LecturesApi {
  Future<Pause> lecturesPostPause(int lectureId) async {
    switch (lectureId) {
      case 1:
        return null;
      case 2:
        throw ApiException(123, "Error Message");
      case 3:
        throw ApiException(481, "Too fast");
    }
    throw "ERROR";
  }
}
