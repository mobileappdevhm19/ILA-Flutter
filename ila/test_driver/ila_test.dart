// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'dart:io';
void main() {
  // This shall be where thy tests reside
  group('Flutter driver demo', (){
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      new Directory('screenshots').create();
    });

    test('check flutter driver health', () async {
      Health health = await driver.checkHealth();
      print(health.status);
    });
    test('Check starting Screen', () async {
      await driver.waitFor(find.text('ILA'));
      //await driver.waitFor(find.text('Copyright'));
      //      await driver.waitFor(find.text('Copyright ILA 2019'));
      //TODO this could be fixed by by testing only loading screen
      // this would break the principle of testing a whole workflow

    });

    test('Login Screen', () async {
      //await driver.waitFor(find.text('Login'));
      //TODO: Explain intended functionality and bug
      await driver.waitFor(find.text('E-Mail'));
      await driver.waitFor(find.text('Password'));
      await driver.tap(find.byValueKey('emailKey'));
      await driver.enterText('Hello !');
      await driver.waitFor(find.text('Hello !'));
      await driver.waitFor(find.text('*********'));
      await driver.tap(find.byValueKey('passwordKey'));
      await driver.enterText('123');
      //await driver.waitFor(find.text('···'));

    });
    test('Login (Navigate to Homescreen)', () async {
      await driver.tap(find.byValueKey('emailKey'));
      await driver.enterText('test@hm.edu');
      await driver.tap(find.byValueKey('passwordKey'));
      await driver.enterText('1234567');
      await driver.waitFor(find.text('1234567'));
      await takeScreenshot(driver, 'screenshots/login_credentials_entered.png');
      await driver.tap(find.byValueKey('loginKey'));
      await driver.waitFor(find.text('Courses'));
    });

    test('Navigate to Courseview', () async {
      await driver.waitFor(find.text('math'));
      await takeScreenshot(driver, 'screenshots/homescreen.png');
      await driver.tap(find.text('Mobile Development'));
      await takeScreenshot(driver, 'screenshots/courseView.png');

    });

    test('Navigate to LectureView', () async{
      await driver.tap(find.text('Demo Lecture'));
      await takeScreenshot(driver, 'screenshots/lectureView.png');

    });

    /*test('Make a bulk of questions', () async{
      await driver.tap(find.text('Ask a question'));
      await takeScreenshot(driver, 'screenshots/askQuestionView.png');
      await driver.tap(find.text('Cancel'));
      for (var j=1;j<30;j++){
        await driver.tap(find.text('Ask a question'));
        await driver.enterText('Bulkitem no.${j}');
        await driver.tap(find.text('Post question'));

      }
      });*/

      test('Ceck all questions (List)View', () async{
        final listFinder = find.byValueKey('allQuestionsList');
        final itemFinder = find.text('Bulkitem no.29');

        await driver.tap(find.text('Show All Questions'));
        await takeScreenshot(driver, 'scrollableView.png');
      final timeline = await driver.traceAction(() async{
        await driver.scrollUntilVisible(
          listFinder,
          itemFinder,
          dyScroll: -900.0,
        );

        expect(await driver.getText(itemFinder), 'Bulkitem no.29');
    });
        // Convert the Timeline into a TimelineSummary that's easier to read and
// understand.
        final summary = new TimelineSummary.summarize(timeline);

// Then, save the summary to disk.
        summary.writeSummaryToFile('scrolling_summary', pretty: true);

// Optionally, write the entire timeline to disk in a json format. This
// file can be opened in the Chrome browser's tracing tools found by
// navigating to chrome://tracing.
        summary.writeTimelineToFile('scrolling_timeline', pretty: true);
    });
      
    // Make Screenshots
    //Performance Profiling
    tearDownAll(() async{
      if (driver != null ){
        await driver.close();
      }
    });
  });
}

takeScreenshot(FlutterDriver driver, String path) async {
  final List<int> pixels = await driver.screenshot();
  final File file = new File(path);
  await file.writeAsBytes(pixels);
  print(path);}