import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/settings/settingsView.dart';
import 'package:mockito/mockito.dart';

import '../../testHelper.dart';

const _testUsername = "TESTUSERNAME";

void main() {
  group('Settings', () {
    testWidgets('Texts', (WidgetTester tester) async {
      await tester
          .pumpWidget(TestHelper.buildPage(SettingsView(), _TestAuthModel()));

      final settingsFinder = find.text('Settings');
      final dataPolicyFinder = find.text('Data Policy');
      final usernameFinder = find.text(_testUsername);

      expect(settingsFinder, findsOneWidget);
      expect(dataPolicyFinder, findsOneWidget);
      expect(usernameFinder, findsOneWidget);
    });

    testWidgets('Navigation Data Policy', (WidgetTester tester) async {
      MockNavigatorObserver navigation = MockNavigatorObserver();
      await tester.pumpWidget(TestHelper.buildPage(
          SettingsView(), _TestAuthModel(),
          navigatorObserver: navigation));

      await tester.tap(find.text('Data Policy'));
      await tester.pumpAndSettle();

      verify(navigation.didPush(any, any));
    });

    testWidgets('Logout', (WidgetTester tester) async {
      MockNavigatorObserver navigation = MockNavigatorObserver();
      await tester.pumpWidget(TestHelper.buildPage(
          SettingsView(), _TestAuthModel(),
          navigatorObserver: navigation));

      await tester.tap(find.byIcon(Icons.exit_to_app));
      await tester.pumpAndSettle();

      verify(navigation.didPush(any, any));
    });
  });
}

class _TestAuthModel extends AuthModel {
  _TestAuthModel() : super(IlaApiClient());

  @override
  getAccountInfo() {
    return {
      'username': _testUsername,
    };
  }

  Future logout() => Future.value(null);
}
