import 'package:flutter/material.dart';

class ErrorPopupDialogue {
  static final String unknownT = "Unexcpected Error";
  static final String unknownB = "Ups, something went wrong there!! Please try again.";

  static void showErrorDialog(context, String title, String body) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(body),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}