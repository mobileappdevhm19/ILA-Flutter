import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ila/main.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/course/addCourseView.dart';
import 'package:ila_swagger/api.dart';

import '../testHelper.dart';

void main() {
  testWidgets('addCourseView', (WidgetTester tester) async {
    coursesApi = _CourseApiMock();

    await tester.pumpWidget(
        TestHelper.buildPage(AddCourseView(), AuthModel(), IlaApiClient()));

    await tester.pump();

    final titleFinder = find.text("ILA");
    final buttonFinder = find.text("Scan QR Code");
    final title1Finder = find.text("Course Id");
    final hintFinder = find.text('Course ID');
    final hintFinder1 = find.text("Course Password");
    final idFinder = find.text("mockID");
    final pwFinder = find.text("mockPassword");

    expect(titleFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);
    expect(title1Finder, findsOneWidget);
    expect(hintFinder, findsOneWidget);
    expect(hintFinder1, findsNWidgets(2));

    await tester.tap(buttonFinder);

    expect(hintFinder1, findsNWidgets(2));
  });
  /*group('scanQRCode', (){
  test('scan actual Code', () async {
    final BarcodeScanner =_BarcodeScannerMock();

  });
  });*/
}

class _CourseApiMock extends CoursesApi {
  Future<List<Course>> coursesJoin(int i, {String token}) async {
    return Future.value([
      Course.fromJson({'title': 'Title1'}),
    ]);
  }
}

//TODO how can we shadow the library import if no instance cen be used in original import?
class _BarcodeScannerMock extends BarcodeScanner {
  Future<String> scan() {
    return Future.value('mockID*mockPassword');
  }
}
