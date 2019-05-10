import 'package:flutter/material.dart';
import 'package:ila/views/homeView.dart';
import 'package:ila/views/loginView.dart';
import 'package:ila/views/settingsView.dart';
import 'package:ila/swagger/api.dart';

Widget makeRoute(
    {@required BuildContext context,
      @required String routeName,
      Object arguments}) {
  final Widget child =
  _buildRoute(context: context, routeName: routeName, arguments: arguments);
  return child;
}

Widget _buildRoute({
  @required BuildContext context,
  @required String routeName,
  Object arguments,
}) {
  switch (routeName) {
    case '/home':
      return HomeView();
    case '/login':
      return LoginView();
    case '/settings':
      return SettingsView();
    default:
      throw 'Route $routeName is not defined';
  }
}