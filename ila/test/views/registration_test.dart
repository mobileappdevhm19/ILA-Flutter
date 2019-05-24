import 'package:flutter_test/flutter_test.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/views/registrationView.dart';

import '../testHelper.dart';

void main() {
  testWidgets('Registration', (WidgetTester tester) async {
    await tester.pumpWidget(TestHelper.buildPage(RegistrationView(), AuthModel()));

    final firstnameFinder = find.text("Firstname");
    final lastnameFinder = find.text("Lastname");
    final emailFinder = find.text("E-Mail");
    final passwordFinder = find.text("Password");
    final passwordRepeateFinder = find.text("Repeate Password");
    final registerFinder = find.text("REGISTER");

    print(firstnameFinder.toString());
    expect(firstnameFinder, findsNWidgets(2));
    expect(lastnameFinder, findsNWidgets(2));
    expect(emailFinder, findsNWidgets(2));
    expect(passwordFinder, findsOneWidget);
    expect(passwordRepeateFinder, findsOneWidget);
    expect(registerFinder, findsOneWidget);
  });
}
