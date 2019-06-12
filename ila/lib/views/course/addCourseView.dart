import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ila/config.dart';
import 'package:ila/helpers/userException.dart';
import 'package:ila/main.dart';
import 'package:ila_swagger/api.dart';
import 'package:barcode_scan/barcode_scan.dart';

class AddCourseView extends StatefulWidget {
  CoursesApi coursesApi;

  AddCourseView(this.coursesApi);

  @override
  _AddCourseViewState createState() => _AddCourseViewState();
}

class _AddCourseViewState extends State<AddCourseView> {
  TextEditingController _idController = TextEditingController();
  TextEditingController _tokenController = TextEditingController();

  int _id;

  _AddCourseViewState() {
    _idController.addListener(_onIdUpdate);
  }

  void _onIdUpdate() {
    try {
      _id = int.parse(_idController.text);
    } catch (error) {
      if (_id.toString() != _idController.text)
        _idController.text = _id.toString();
      // TODO: handle error
    }
  }

  _registerButtonOnPressed(BuildContext context) async {
    widget.coursesApi.coursesJoin(_id, token: _tokenController.text).then((_) async {
      Navigator.pop(context);
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Course Added'),
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

  Future _scan() async {
    try {
      String barcode = await BarcodeScanner.scan();

      List<String> values = barcode.split('*');
      //setState(() {
      _idController.text = values[0];
      _tokenController.text = values[1];
      //});
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        //TODO: handle error
        print('The user did not grant the camera permission!');
      } else {
        //TODO: handle error
        print('Uknown error: $e');
      }
    } on FormatException {
      //TODO: handle error
      print(
          'null (User returned using the "back"-button before scanning anything. Result)s');
    } catch (e) {
      //TODO: handle error
      print('Uknown error: $e');
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _idController.dispose();
    _tokenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Config.AppTitle)),
      body: Center(child: Builder(builder: (context) => _form(context))),
    );
  }

  Widget _form(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(15.0),
      children: <Widget>[
        new Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
          alignment: Alignment.center,
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: new FlatButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  color: Config.PrimaryColor,
                  onPressed: () => _scan(),
                  child: new Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 20.0,
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Expanded(
                          child: Text(
                            "Scan QR Code",
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
        Divider(height: 24.0),
        new Row(
          children: <Widget>[
            new Expanded(
              child: new Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: new Text(
                  "Course Id",
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
          margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  color: Config.AppColorDark,
                  width: 0.5,
                  style: BorderStyle.solid),
            ),
          ),
          padding: const EdgeInsets.only(left: 0.0, right: 10.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                child: TextField(
                  controller: _idController,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Course ID',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(height: 24.0),
        new Row(
          children: <Widget>[
            new Expanded(
              child: new Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: new Text(
                  "Course Password",
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
          margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  color: Config.AppColorDark,
                  width: 0.5,
                  style: BorderStyle.solid),
            ),
          ),
          padding: const EdgeInsets.only(left: 0.0, right: 10.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                child: TextField(
                  controller: _tokenController,
                  maxLength: 10,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Course Password',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(height: 24.0),
        new Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
          alignment: Alignment.center,
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: new FlatButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  color: Config.PrimaryColor,
                  onPressed: () => _registerButtonOnPressed(context),
                  child: new Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 20.0,
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Expanded(
                          child: Text(
                            "REGISTER",
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
    );
  }
}
