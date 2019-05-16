import 'package:flutter_test/flutter_test.dart';
import 'package:ila/main.dart';

void main() {
  testWidgets('Startup', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final copyrightFinder = find.text("© Copyright ILA 2019");
    final titleFinder = find.text("ILA");

    expect(copyrightFinder, findsOneWidget);
    expect(titleFinder, findsOneWidget);
  });
}
