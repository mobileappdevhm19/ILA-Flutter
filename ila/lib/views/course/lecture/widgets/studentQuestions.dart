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
          margin: new EdgeInsets.symmetric(
              vertical: 4.0, horizontal: 4.0),
          padding: const EdgeInsets.symmetric(
              horizontal: 2.0, vertical: 6.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: new EdgeInsets.symmetric(
                        horizontal: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        ClipOval(
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            child:
                            Icon(Icons.question_answer),
                          ),
                        ),
                        Expanded(
                          child: Container(
                              padding:
                              new EdgeInsets.symmetric(
                                  horizontal: 12.0),
                              child:
                              Column(children: <Widget>[
                                Text('Student Questions',
                                    style: TextStyle(
                                        fontWeight:
                                        FontWeight
                                            .bold))
                              ])),
                        )
                      ],
                    )),
                Container(
                  padding: new EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 8.0),
                  child: _studentQuestionsisData
                      ? ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          ListTile(
                            title: Text(
                                _studentQuestions[index]
                                    .pointedQuestion),
                          ),
                      separatorBuilder:
                          (context, index) => Divider(),
                      itemCount:
                      _studentQuestions.length > 3
                          ? 3
                          : _studentQuestions
                          .length)
                      : Center(
                      child:
                      CircularProgressIndicator()),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            child: Card(
                                child: Column(
                                    mainAxisSize:
                                    MainAxisSize.min,
                                    children: <Widget>[
                                      Text('Ask a Question',
                                          style: Theme.of(context)
                                              .textTheme
                                              .display1),
                                      TextField(
                                          maxLines: 20,
                                          autofocus: true,
                                          controller: _controller,
                                          textInputAction:
                                          TextInputAction.send,
                                          decoration: InputDecoration(
                                              border:
                                              OutlineInputBorder())),
                                      ButtonTheme.bar(
                                        // make buttons use the appropriate styles for cards
                                          child:
                                          ButtonBar(children: <
                                              Widget>[
                                            FlatButton(
                                              child:
                                              const Text('Cancel'),
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop();
                                              },
                                            ),
                                            FlatButton(
                                              child: const Text(
                                                  'Post question'),
                                              //Example for Posting to API via inline generated JSON
                                              onPressed: () {
                                                LecturesApi()
                                                    .lecturesPostQuestion(
                                                    widget
                                                        .lecture.id,
                                                    QuestionCreate
                                                        .fromJson({
                                                      "pointedQuestion":
                                                      _controller
                                                          .text
                                                    }));
                                                Navigator.of(context)
                                                    .pop();
                                                this.initState();
                                              },
                                            ),
                                          ]))
                                    ]))).then((_) {
                          setState(() {
                            _studentQuestionsisData = false;
                          });
                          _load();
                        });},
                        child: Text('Ask a question'),
                        color: Colors.primaries[0],
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(
                                30.0)),
                      ),
                    ],
                  ),
                )
              ])),
    );
  }
}
