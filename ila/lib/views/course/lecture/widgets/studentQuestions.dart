import 'package:flutter/material.dart';
import 'package:ila_swagger/api.dart';

class StudentQuestions extends StatefulWidget {
  final Lecture lecture;
  final LecturesApi lecturesApi;

  StudentQuestions(this.lecturesApi, this.lecture);

  @override
  _StudentQuestionsState createState() => _StudentQuestionsState();
}

class _StudentQuestionsState extends State<StudentQuestions> {
  bool _studentQuestionsisData = false;
  List<Question> _studentQuestions;

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() {
    widget.lecturesApi
        .lecturesGetQuestions(widget.lecture.id)
        .then((questions) {
      _studentQuestions = questions;
      setState(() {
        _studentQuestionsisData = true;
      });
    }).catchError((error) {
      print(error.toString());
      // TODO handle error
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                                Text('Student Questions',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                              ])),
                        )
                      ],
                    )),
                Container(
                  padding:
                      new EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  child: _studentQuestionsisData
                      ? ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => ListTile(
                                title: Text(
                                    _studentQuestions[index].pointedQuestion),
                                onTap: () => Navigator.of(context).pushNamed(
                                    '/lecture/question',
                                    arguments: _studentQuestions[index]),
                              ),
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: _studentQuestions.length > 3
                              ? 3
                              : _studentQuestions.length)
                      : Center(child: CircularProgressIndicator()),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed('/lecture/question/new',
                                  arguments: widget.lecture)
                              .then((_) {
                            setState(() {
                              _studentQuestionsisData = false;
                            });
                            _load();
                          });
                        },
                        child: Text('Ask a question'),
                        color: Colors.primaries[0],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed('/lecture/questions/all',
                              arguments: widget.lecture.questions);
                        },
                        child: Text('Show All Questions'),
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
