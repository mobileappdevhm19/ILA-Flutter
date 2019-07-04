import 'package:flutter/material.dart';
import 'package:ila/config.dart';
import 'package:ila/helpers/routes.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/splashScreen.dart';
import 'package:ila/widgets/ilaToast.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
FirebaseAnalytics analytics = FirebaseAnalytics();

void main() => runApp(MyApp(apiClient: IlaApiClient()));

class MyApp extends StatelessWidget {
  IlaApiClient apiClient;

  MyApp({this.apiClient});

  @override
  Widget build(BuildContext context) {
    return ILAToast(
      child: ScopedModel<AuthModel>(
        model: AuthModel(apiClient),
        child: MaterialApp(
          title: Config.AppTitle,
          theme: ThemeData(
            primarySwatch: Config.PrimaryColor,
          ),
          navigatorObservers: [
            FirebaseAnalyticsObserver(analytics: analytics),
          ],
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
      ),
    );
  }
}
