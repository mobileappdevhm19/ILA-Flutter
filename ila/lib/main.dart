import 'package:flutter/material.dart';
import 'package:ila/config.dart';
import 'package:ila/helpers/routes.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila/views/splashScreen.dart';
import 'package:scoped_model/scoped_model.dart';

final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

void main() => runApp(MyApp(apiClient: IlaApiClient()));

class MyApp extends StatelessWidget {
  IlaApiClient apiClient;

  MyApp({this.apiClient});

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AuthModel>(
      model: AuthModel(apiClient),
      child: MaterialApp(
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
