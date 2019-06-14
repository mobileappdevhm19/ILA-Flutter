import 'package:flutter/material.dart';
import 'package:ila/config.dart';
import 'package:ila/helpers/routes.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/splashScreen.dart';
import 'package:ila_swagger/api.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

LecturesApi lecturesApi;
CoursesApi coursesApi;
UserApi userApi;
AccountApi accountApi;


void main() => runApp(MyApp(IlaApiClient()));

class MyApp extends StatelessWidget {
  IlaApiClient apiClient;
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  MyApp(this.apiClient) {
    defaultApiClient = apiClient;

    lecturesApi = LecturesApi();
    coursesApi = CoursesApi();
    userApi = UserApi();
    accountApi = AccountApi();

  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AuthModel>(
      model: AuthModel(),
      child: MaterialApp(
        navigatorObservers: <NavigatorObserver>[observer],
        title: Config.AppTitle,
        theme: ThemeData(
          primarySwatch: Config.PrimaryColor,
        ),
        home: SplashScreen(),
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) => makeRoute(
                  context: context,
                  routeName: settings.name,
                  arguments: settings.arguments,
                ),
            maintainState: true,
            fullscreenDialog: false,
          );
        },
      ),
    );
  }
}
