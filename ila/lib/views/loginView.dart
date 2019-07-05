import 'package:flutter/material.dart';
import 'package:ila/config.dart';
import 'package:ila/helpers/userException.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/widgets/ilaToast.dart';
import 'package:scoped_model/scoped_model.dart';

import '../main.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(Config.AppTitle),
        ),
        body: Center(
            child: Builder(
                builder: (context) => ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(15.0),
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(50.0),
                          child: Center(
                            child: Icon(
                              Icons.security,
                              color: Config.AppColorDark,
                              size: 50.0,
                            ),
                          ),
                        ),
                        new Row(
                          children: <Widget>[
                            new Expanded(
                              child: new Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: new Text(
                                  "E-Mail",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Config.PrimaryColor,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        new Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(
                              left: 40.0, right: 40.0, top: 10.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: Config.AppColorDark,
                                  width: 0.5,
                                  style: BorderStyle.solid),
                            ),
                          ),
                          padding:
                              const EdgeInsets.only(left: 0.0, right: 10.0),
                          child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new Expanded(
                                child: TextField(
                                  key: ValueKey('emailKey'),
                                  controller: _usernameController,
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'E-Mail',
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 24.0,
                        ),
                        new Row(
                          children: <Widget>[
                            new Expanded(
                              child: new Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: new Text(
                                  "Password",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Config.PrimaryColor,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        new Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(
                              left: 40.0, right: 40.0, top: 10.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: Colors.redAccent,
                                  width: 0.5,
                                  style: BorderStyle.solid),
                            ),
                          ),
                          padding:
                              const EdgeInsets.only(left: 0.0, right: 10.0),
                          child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new Expanded(
                                child: TextField(
                                  key:ValueKey('passwordKey'),
                                  controller: _passwordController,
                                  obscureText: true,
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '*********',
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 24.0,
                        ),
                        new Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 20.0),
                          alignment: Alignment.center,
                          child: new Row(
                            children: <Widget>[
                              new Expanded(
                                child: new FlatButton(
                                  key: ValueKey('loginKey'),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(4.0),
                                  ),
                                  color: Config.PrimaryColor,
                                  onPressed: () =>
                                      _loginButtonOnPressed(context),
                                  child: new Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 20.0,
                                      horizontal: 20.0,
                                    ),
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        new Expanded(
                                          child: Text(
                                            "Login",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        new Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 20.0),
                          alignment: Alignment.center,
                          child: new Row(
                            children: <Widget>[
                              new Expanded(
                                child: new FlatButton(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(4.0),
                                  ),
                                  color: Config.AppColorDark,
                                  onPressed: () => Navigator.of(context)
                                      .pushNamed('/registration'),
                                  child: new Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 20.0,
                                      horizontal: 20.0,
                                    ),
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        new Expanded(
                                          child: Text(
                                            "Registration",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))));
  }

  _loginButtonOnPressed(BuildContext context) async {
    var auth = ScopedModel.of<AuthModel>(context);
    await auth
        .login(_usernameController.text, _passwordController.text)
        .then((_) => Navigator.pushReplacementNamed(context, '/home'))
        .catchError((e) {
      ILAToast.of(context).showToast(
        toastType: ToastType.error,
        message: e is UserException
            ? (e as UserException).message
            : 'Unbekannter Fehler ist aufgetretten',
      );
    });
  }
}
