import 'package:flutter_test/flutter_test.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/settings/dataPolicyView.dart';

import '../../testHelper.dart';

void main() {
  testWidgets('Data Policy', (WidgetTester tester) async {
    await tester.pumpWidget(TestHelper.buildPage(DataPolicyView(), AuthModel(IlaApiClient())));

    final titleFinder = find.text("Data Policy");

    expect(titleFinder, findsOneWidget);
  });
}
