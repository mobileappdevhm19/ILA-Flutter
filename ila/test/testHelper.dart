import 'package:flutter/material.dart';
import 'package:ila/helpers/routes.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:scoped_model/scoped_model.dart';

class TestHelper {
  static buildPage(page, AuthModel authModel) {
    return ScopedModel<AuthModel>(
      model: authModel,
      child: MaterialApp(
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
      ),
    );
  }
}
