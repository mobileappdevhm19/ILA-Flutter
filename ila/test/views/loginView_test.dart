import 'package:flutter_test/flutter_test.dart';
import 'package:ila/helpers/userException.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/loginView.dart';
import 'package:mockito/mockito.dart';
import '../testHelper.dart';

void main() {
  MockNavigatorObserver mockNavigator = MockNavigatorObserver();
  group('Login', () {
    testWidgets('Texts', (WidgetTester tester) async {
      await tester.pumpWidget(
          TestHelper.buildPage(LoginView(), AuthModel(), IlaApiClient()));

      final usernameFinder = find.text("E-Mail");
      final passwordFinder = find.text("Password");
      final loginFinder = find.text("Login");
      final registrationFinder = find.text("Registration");

      expect(usernameFinder, findsNWidgets(2));
      expect(passwordFinder, findsOneWidget);
      expect(loginFinder, findsOneWidget);
      expect(registrationFinder, findsOneWidget);
    });

    testWidgets('Login failed unexpectedError', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.buildPage(
          LoginView(), AuthModel(), _IlaApiClientLogin(null, false)));

      await tester.tap(find.text("Login"));

      await tester.pump();
      expect(find.text('Unbekannter Fehler ist aufgetretten'), findsOneWidget);
    });

    testWidgets('Login failed UserException', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.buildPage(
          LoginView(),
          AuthModel(),_IlaApiClientLogin(
              UserException(message: 'USEREXCEPTION'), false)));

      await tester.tap(find.text("Login"));

      await tester.pump();
      expect(find.text('USEREXCEPTION'), findsOneWidget);
    });

    testWidgets('Navigation - Registration', (WidgetTester tester) async {
      MockNavigatorObserver navigation = MockNavigatorObserver();
      await tester.pumpWidget(TestHelper.buildPage(
          LoginView(), AuthModel(),IlaApiClient(),
          navigatorObserver: navigation));

      await tester.tap(find.text('Registration'));
      await tester.pumpAndSettle();

      verify(navigation.didPush(any, any));
    });
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
