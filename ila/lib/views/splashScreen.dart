import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ila/config.dart';
import 'package:ila/helpers/platformScaffold.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila_swagger/api.dart';
import 'package:scoped_model/scoped_model.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer _timer;

  startTime() async {
    int counter = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final state = ScopedModel.of<AuthModel>(context).getStatus();
      if (counter++ >= Config.SplashScreenDuration ||
          state == AuthStatus.None ||
          state == AuthStatus.LoginFailed) {
        // Cancel Timer
        timer.cancel();

        // Navigate to LoginPage
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        Navigator.of(context).pushReplacementNamed('/login');
      }
      if (state == AuthStatus.LoggedIn) {
        // Cancel Timer
        timer.cancel();

        // Navigate to HomePage
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTime();
    ScopedModel.of<AuthModel>(context).init();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var drawer = Drawer();

    return PlatformScaffold(
      drawer: drawer,
      body: Container(
        decoration: BoxDecoration(color: Config.PrimaryColor),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: FractionalOffset(0.5, 0.3),
                child: Text(
                  "ILA",
                  style: TextStyle(fontSize: 40.0, color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
              child: Text(
                "© Copyright ILA 2019",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
