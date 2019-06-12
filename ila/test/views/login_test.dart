import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ila/helpers/userException.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/homeView.dart';
import 'package:ila/views/loginView.dart';
import 'package:mockito/mockito.dart';
import '../testHelper.dart';

void main() {
  MockNavigatorObserver mockNavigator = MockNavigatorObserver();

  testWidgets('Login', (WidgetTester tester) async {
    await tester.pumpWidget(
        TestHelper.buildPage(LoginView(), AuthModel(IlaApiClient())));

    final usernameFinder = find.text("USERNAME");
    final passwordFinder = find.text("PASSWORD");
    final loginFinder = find.text("LOGIN");
    final registrationFinder = find.text("REGISTRATION");

    expect(usernameFinder, findsOneWidget);
    expect(passwordFinder, findsOneWidget);
    expect(loginFinder, findsOneWidget);
    expect(registrationFinder, findsOneWidget);
  });

  testWidgets('Login failed unexpectedError', (WidgetTester tester) async {
    await tester.pumpWidget(TestHelper.buildPage(
        LoginView(), AuthModel(_IlaApiClientLogin(null, false))));

    await tester.tap(find.text("LOGIN"));

    await tester.pump();
    expect(find.text('Unbekannter Fehler ist aufgetretten'), findsOneWidget);
  });

  testWidgets('Login failed UserException', (WidgetTester tester) async {
    await tester.pumpWidget(TestHelper.buildPage(
        LoginView(),
        AuthModel(_IlaApiClientLogin(
            UserException(message: 'USEREXCEPTION'), false))));

    await tester.tap(find.text("LOGIN"));

    await tester.pump();
    expect(find.text('USEREXCEPTION'), findsOneWidget);
  });
}

class _IlaApiClientLogin extends IlaApiClient {
  final bool loginSuccess;
  final Object loginException;

  _IlaApiClientLogin(this.loginException, this.loginSuccess);

  Future login(String username, String password) {
    if (loginSuccess) {
      return Future.value(null);
    } else {
      return Future.error(loginException);
    }
  }
}
