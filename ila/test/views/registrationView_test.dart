import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:ila/config.dart';
import 'package:ila/helpers/userException.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/registrationView.dart';
import 'package:ila_swagger/api.dart';

import '../testHelper.dart';

void main() {
  testWidgets('Registration', (WidgetTester tester) async {
    await tester.pumpWidget(TestHelper.buildPage(
        RegistrationView(accountApi: AccountApi()), AuthModel(IlaApiClient())));

    final firstnameFinder = find.text("Firstname");
    final lastnameFinder = find.text("Lastname");
    final emailFinder = find.text("E-Mail");
    final passwordFinder = find.text("Password");
    final passwordRepeateFinder = find.text("Repeate Password");
    final registerFinder = find.text("Register");

    expect(firstnameFinder, findsNWidgets(2));
    expect(lastnameFinder, findsNWidgets(2));
    expect(emailFinder, findsNWidgets(2));
    expect(passwordFinder, findsOneWidget);
    expect(passwordRepeateFinder, findsOneWidget);
    expect(registerFinder, findsOneWidget);
  });

  testWidgets('Registration passwords not equal', (WidgetTester tester) async {
    await tester.pumpWidget(TestHelper.buildPage(
        RegistrationView(accountApi: AccountApi()), AuthModel(IlaApiClient())));

    await tester.enterText(find.byType(TextField).at(3), 'ABC');
    await tester.enterText(find.byType(TextField).at(4), 'DEF');

    await tester.tap(find.text("Register"));

    await tester.pumpAndSettle();
    expect(find.text('Passwords do not match.'), findsOneWidget);
    await tester.pumpAndSettle(Duration(seconds: Config.ToastDuration));
  });

  testWidgets('Registration error UserException', (WidgetTester tester) async {
    await tester.pumpWidget(TestHelper.buildPage(
        RegistrationView(
            accountApi: _AccountApiMock(
                UserException(message: 'USEREXCEPTION'), false)),
        AuthModel(IlaApiClient())));

    await tester.enterText(find.byType(TextField).at(0), 'FirstName');
    await tester.enterText(find.byType(TextField).at(1), 'LastName');
    await tester.enterText(find.byType(TextField).at(2), 'test@email.com');
    await tester.enterText(find.byType(TextField).at(3), 'Password');
    await tester.enterText(find.byType(TextField).at(4), 'Password');

    await tester.tap(find.text('Register'));

    await tester.pumpAndSettle();
    expect(find.text('USEREXCEPTION'), findsOneWidget);
    await tester.pumpAndSettle(Duration(seconds: Config.ToastDuration));
  });

  testWidgets('Registration error AnyException', (WidgetTester tester) async {
    await tester.pumpWidget(TestHelper.buildPage(
        RegistrationView(accountApi: _AccountApiMock('ANY Exception', false)),
        AuthModel(IlaApiClient())));

    await tester.enterText(find.byType(TextField).at(0), 'FirstName');
    await tester.enterText(find.byType(TextField).at(1), 'LastName');
    await tester.enterText(find.byType(TextField).at(2), 'test@email.com');
    await tester.enterText(find.byType(TextField).at(3), 'Password');
    await tester.enterText(find.byType(TextField).at(4), 'Password');

    await tester.tap(find.text('Register'));

    await tester.pumpAndSettle();
    expect(find.text('Unbekannter Fehler ist aufgetretten'), findsOneWidget);
    await tester.pumpAndSettle(Duration(seconds: Config.ToastDuration));
  });
  testWidgets('Registration successful', (WidgetTester tester) async {
    MockNavigatorObserver navigaton = MockNavigatorObserver();
    await tester.pumpWidget(TestHelper.buildPage(
        RegistrationView(accountApi: _AccountApiMock(null, true)),
        AuthModel(IlaApiClient()),
        navigatorObserver: navigaton));

    await tester.enterText(find.byType(TextField).at(0), 'FirstName');
    await tester.enterText(find.byType(TextField).at(1), 'LastName');
    await tester.enterText(find.byType(TextField).at(2), 'test@email.com');
    await tester.enterText(find.byType(TextField).at(3), 'Password');
    await tester.enterText(find.byType(TextField).at(4), 'Password');

    await tester.tap(find.text('Register'));

    await tester.pumpAndSettle();
    expect(find.text('Account created.'), findsOneWidget);
    await tester.pumpAndSettle(Duration(seconds: Config.ToastDuration));
  });
}

class _AccountApiMock extends AccountApi {
  final bool registerSuccess;
  final Object registerException;

  _AccountApiMock(this.registerException, this.registerSuccess);

  Future<MultipartFile> accountSignUp(SignUp request) async {
    if (registerSuccess) {
      return Future.value(null);
    } else {
      return Future.error(registerException);
    }
  }
}
