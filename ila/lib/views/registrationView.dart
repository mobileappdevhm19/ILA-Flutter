import 'package:flutter/material.dart';
import 'package:ila/helpers/userException.dart';
import 'package:ila/widgets/ilaToast.dart';
import 'package:ila_swagger/api.dart';
import '../config.dart';
import '../main.dart';

class RegistrationView extends StatefulWidget {
  final AccountApi accountApi;

  RegistrationView({@required this.accountApi}) {}

  @override
  _RegistrationViewState createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _password2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Config.AppTitle),
        ),
        body: Center(
            child: Builder(
                builder: (context) => ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(15.0),
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            new Expanded(
                              child: new Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: new Text(
                                  "Firstname",
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
                                  controller: _firstName,
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Firstname',
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
                                  "Lastname",
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
                                  controller: _lastName,
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Lastname',
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
                                  controller: _email,
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
                                  obscureText: true,
                                  controller: _password,
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
                        new Row(
                          children: <Widget>[
                            new Expanded(
                              child: new Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: new Text(
                                  "Repeate Password",
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
                                  obscureText: true,
                                  controller: _password2,
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
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                  color: Config.PrimaryColor,
                                  onPressed: () =>
                                      _registerButtonOnPressed(context),
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
                                            "Register",
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

  _registerButtonOnPressed(BuildContext context) async {
    if (_password2.text != _password.text) {
      ILAToast.of(context).showToast(
        toastType: ToastType.error,
        message: 'Passwords do not match.',
      );
      return;
    }

    widget.accountApi
        .accountSignUp(SignUp.fromJson({
      'username': _email.text,
      'password': _password.text,
      'firstName': _firstName.text,
      'lastName': _lastName.text,
    }))
        .then((_) async {
      Navigator.of(context).pop();
      ILAToast.of(context).showToast(
        toastType: ToastType.success,
        message: 'Account created.',
      );
    }).catchError((e) {
      if (e is FormatException) {
        Navigator.of(context).pop();
        ILAToast.of(context).showToast(
          toastType: ToastType.success,
          message: 'Account created.',
        );
      } else {
        ILAToast.of(context).showToast(
          toastType: ToastType.error,
          message: e is UserException
              ? (e as UserException).message
              : 'Unbekannter Fehler ist aufgetretten',
        );
      }
    });
  }
}
