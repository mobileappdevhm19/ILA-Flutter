import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ila/config.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/splashScreen.dart';
import 'package:mockito/mockito.dart';

import '../testHelper.dart';

void main() {
  group('SplashScreen', () {
    MockNavigatorObserver navigation = MockNavigatorObserver();

    testWidgets('Texts', (WidgetTester tester) async {
      await tester.pumpWidget(
          TestHelper.buildPage(SplashScreen(), AuthModel(IlaApiClient())));

      final copyrightFinder = find.text("© Copyright ILA 2019");
      final titleFinder = find.text("ILA");

      expect(copyrightFinder, findsOneWidget);
      expect(titleFinder, findsOneWidget);
    });

    testWidgets('Successfull Login', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.buildPage(
          SplashScreen(), _AuthModel(1),
          navigatorObserver: navigation));

      await tester.pumpAndSettle();

      verify(navigation.didPush(any, any));
    });

    testWidgets('Failed Login', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.buildPage(
          SplashScreen(), _AuthModel(2),
          navigatorObserver: navigation));

      await tester.pumpAndSettle();

      verify(navigation.didPush(any, any));
    });

    testWidgets('Timeout', (WidgetTester tester) async {
      await tester.pumpWidget(TestHelper.buildPage(
          SplashScreen(), _AuthModel(2),
          navigatorObserver: navigation));

      await tester
          .pumpAndSettle(Duration(seconds: Config.SplashScreenDuration + 1));

      verify(navigation.didPush(any, any));
    });
  });
}

class _AuthModel extends AuthModel {
  final int testCase;

  _AuthModel(this.testCase)
      : super(IlaApiClient(), storage: _FlutterSecureStorage());

  Future init() async {}

  AuthStatus getStatus() {
    return testCase == 1 ? AuthStatus.LoggedIn : AuthStatus.LoginFailed;
  }
}

class _FlutterSecureStorage extends FlutterSecureStorage {}
