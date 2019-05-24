import 'package:flutter_test/flutter_test.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/views/splashScreen.dart';

import '../testHelper.dart';

void main() {
  testWidgets('Splash', (WidgetTester tester) async {
    await tester.pumpWidget(TestHelper.buildPage(SplashScreen(), AuthModel()));

    final copyrightFinder = find.text("© Copyright ILA 2019");
    final titleFinder = find.text("ILA");

    expect(copyrightFinder, findsOneWidget);
    expect(titleFinder, findsOneWidget);
  });
}
