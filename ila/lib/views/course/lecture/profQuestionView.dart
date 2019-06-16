import 'package:flutter/material.dart';
import 'package:ila/config.dart';
import 'package:ila/widgets/ilaToast.dart';
import 'package:ila_swagger/api.dart';

class ProfQuestionView extends StatefulWidget {
  Lecture lecture;

  ProfQuestionView({this.lecture});


  @override
  _ProfQuestionViewState createState() => _ProfQuestionViewState();
}

class _ProfQuestionViewState extends State<ProfQuestionView> {
  bool _isData = false;
  List<Question> _questions;

  @override
  void initState() {
    super.initState();

    LecturesApi().lecturesGetQuestions(widget.lecture.id).then((questions) {
      _questions = questions;
      setState(() {
        _isData = true;
      });
    }).catchError((error) {
      print(error.toString());
      ILAToast.of(context).showToast(
        toastType: ToastType.error,
        message: 'Fehler ist aufgetretten',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lecture.title),
      ),
      body: Builder(
        builder: (context) => Container(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        "Questions",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Config.PrimaryColor,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Divider(
                  height: 24.0,
                ),
              ),
              _isData
                  ? ListView.separated(
                shrinkWrap: true,
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  //TODO title: Text(_questions[index].title),
                Padding(
                padding:
                const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                child: Text(
                _questions[index].pointedQuestion,
                style: TextStyle(fontSize: 18.0),
                )
                );}

              )
                  : Center(child: CircularProgressIndicator())
            ],
          ),
        ),
      ),
    );
  }
}