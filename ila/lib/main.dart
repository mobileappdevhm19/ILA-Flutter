import 'package:flutter/material.dart';
import 'package:ila/config.dart';
import 'package:ila/helpers/routes.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/views/splashScreen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:ila_swagger/api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<AuthModel>(
      model: AuthModel(),
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
