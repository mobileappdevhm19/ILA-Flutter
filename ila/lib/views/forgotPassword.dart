import 'package:flutter/material.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila_swagger/api.dart';
import 'package:scoped_model/scoped_model.dart';

import '../config.dart';
import '../main.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String _email;

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
                              onChanged: (value) => _email = value,
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

                    new Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 40.0),
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
                                        "SEND",
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

    AccountApi()
        .accountSignUp(SignUp.fromJson({
      'username': _email,
    }))
        .then((_) async {
      await Navigator.pop(context);
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Please check your mails.'),
        duration: Duration(seconds: 4),
      ));
    }).catchError((e) {
      print(e.toString());
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(e is UserException
            ? (e as UserException).message
            : 'Unbekannter Fehler ist aufgetretten'),
        duration: Duration(seconds: 4),
      ));
    });
  }
}