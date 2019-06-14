import 'package:flutter/material.dart';
import 'package:ila/helpers/routes.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila_swagger/api.dart';
import 'package:mockito/mockito.dart';
import 'package:scoped_model/scoped_model.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class TestHelper {
  static buildPage(page, AuthModel authModel, IlaApiClient apiClient,
      {NavigatorObserver navigatorObserver}) {
    defaultApiClient = apiClient;

    MaterialApp app;
    if (navigatorObserver != null)
      app = MaterialApp(
        navigatorObservers: [navigatorObserver],
        home: page,
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
      );
    else
      app = MaterialApp(
        home: page,
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
      );

    return ScopedModel<AuthModel>(model: authModel, child: app);
  }
}
