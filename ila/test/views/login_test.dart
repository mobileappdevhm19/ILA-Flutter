import 'package:flutter_test/flutter_test.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/views/loginView.dart';

import '../testHelper.dart';

void main() {
  testWidgets('Login', (WidgetTester tester) async {
    await tester.pumpWidget(TestHelper.buildPage(LoginView(), AuthModel()));

    final usernameFinder = find.text("USERNAME");
    final passwordFinder = find.text("PASSWORD");
    final loginFinder = find.text("LOGIN");
    final registrationFinder = find.text("REGISTRATION");

    expect(usernameFinder, findsOneWidget);
    expect(passwordFinder, findsOneWidget);
    expect(loginFinder, findsOneWidget);
    expect(registrationFinder, findsOneWidget);
  });
}
