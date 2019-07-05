import 'package:flutter/material.dart';
import 'package:ila/widgets/ilaToast.dart';
import 'package:ila_swagger/api.dart';

class ProfessorQuestions extends StatefulWidget {
  final Lecture lecture;
  final ProfQuestionApi questionApi;

  ProfessorQuestions(this.questionApi, this.lecture);

  @override
  _ProfessorQuestionsState createState() => _ProfessorQuestionsState();
}

class _ProfessorQuestionsState extends State<ProfessorQuestions> {
  bool _profQuestionsIsData = false;
  List<ProfQuestion> _professorQuestions;

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() {
    widget.questionApi.profQuestionGet(widget.lecture.id).then((questions) {
      _professorQuestions = questions;
      setState(() {
        _profQuestionsIsData = true;
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
    return Card(
      color: Colors.white70,
      child: Container(
          margin: new EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
          padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 6.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: new EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        ClipOval(
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            child: Icon(Icons.question_answer),
                          ),
                        ),
                        Expanded(
                          child: Container(
                              padding:
                                  new EdgeInsets.symmetric(horizontal: 12.0),
                              child: Column(children: <Widget>[
                                Text('Lecture Questions',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                              ])),
                        )
                      ],
                    )),
                Container(
                  padding:
                      new EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  child: _profQuestionsIsData
                      ? ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => ListTile(
                                title: Text(
                                    _professorQuestions[index].question),
                                onTap: () => Navigator.of(context).pushNamed(
                                    '/lecture/profQuestion',
                                    arguments: _professorQuestions[index]),
                              ),
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: _professorQuestions.length > 3
                              ? 3
                              : _professorQuestions.length)
                      : Center(child: CircularProgressIndicator()),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                       RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                              '/lecture/profQuestions/all',
                              arguments: widget.lecture);
                        },
                        child: Text('Show All Professor Questions'),
                        color: Colors.primaries[0],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                    ],
                  ),
                )
              ])),
    );
  }
}
