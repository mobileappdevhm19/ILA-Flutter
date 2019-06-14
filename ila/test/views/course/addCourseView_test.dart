import 'package:flutter_test/flutter_test.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/course/addCourseView.dart';
import 'package:ila_swagger/api.dart';
import '../../testHelper.dart';
import 'package:ila/main.dart';

void main() {
  testWidgets('Join Course', (WidgetTester tester) async {
    coursesApi = _CourseApiMock();

    await tester.pumpWidget(TestHelper.buildPage(
        AddCourseView(), AuthModel(IlaApiClient())));

    final titleFinder = find.text("ILA");
    final qrCodeFinder = find.text("Scan QR Code");
    final idFinder = find.text("Course Id");
    final passphraseFinder = find.text("Course Password");
    final registerFinder = find.text("REGISTER");

    expect(titleFinder, findsOneWidget);
    expect(qrCodeFinder, findsOneWidget);
    expect(idFinder, findsOneWidget);
    expect(passphraseFinder, findsNWidgets(2));
    expect(registerFinder, findsOneWidget);
  });
}

class _CourseApiMock extends CoursesApi {}
