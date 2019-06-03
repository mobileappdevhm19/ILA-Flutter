import 'package:flutter_test/flutter_test.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/settingsView.dart';

import '../testHelper.dart';

const _testUsername = "TESTUSERNAME";
void main() {
  testWidgets('Settings', (WidgetTester tester) async {
    await tester.pumpWidget(TestHelper.buildPage(SettingsView(), _TestAuthModel()));

    final settingsFinder = find.text("Settings");
    final usernameFinder = find.text(_testUsername);

    expect(settingsFinder, findsOneWidget);
    expect(usernameFinder, findsOneWidget);
  });
}

class _TestAuthModel extends AuthModel{
  _TestAuthModel() : super(IlaApiClient());

  @override
  getAccountInfo() {
    return {
      'username': _testUsername,
    };
  }
}
