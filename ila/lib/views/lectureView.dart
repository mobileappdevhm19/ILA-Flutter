import 'package:flutter/material.dart';
import 'package:ila/config.dart';
import 'package:ila_swagger/api.dart';

class LectureView extends StatefulWidget {
  Lecture lecture;

  LectureView({this.lecture});


  @override
  _LectureViewState createState() => _LectureViewState();
}

class _LectureViewState extends State<LectureView> {
  bool _isData = false;
  List<Question> _profQues;
  List<Question> _studQues;



  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    LecturesApi().lecturesGetQuestion(widget.lecture.id).then((questions) {
      _profQues = questions;
      setState(() {
        _isData = true;
      });
    }).catchError((error) {
      print(error.toString());
      // TODO handle error
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
          child: ListView.builder(
            itemCount: 1,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Column(children: <Widget>[
                FlatButton(
                  child: Icon(
                    Icons.block,
                    size: 80,
                  ),
                  onPressed: () => LecturesApi().lecturesPostPause(widget.lecture.id),
                ),
                Divider(
                  height: 8,
                  color: Colors.black,
                ),
                Text('Professor Questions'),
                ListView.builder(
                    itemCount: _profQues?.length ?? 0,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                    return FlatButton(
                      child: Text('Question $index'),
                      onPressed: (){
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                          return AlertDialog(
                            content: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text('Question : ' + _profQues[index].pointedQuestion),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      FlatButton(
                                        child: Text(_profQues[index].answers[0].comment),
                                        onPressed: () => _profQues[index].answers[0].votes++,
                                      ),

                                      FlatButton(
                                        child: Text(_profQues[index].answers[1].comment),
                                        onPressed: () => _profQues[index].answers[1].votes++,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      FlatButton(
                                        child: Text(_profQues[index].answers[2].comment),
                                        onPressed: () => _profQues[index].answers[2].votes++,
                                      ),
                                      FlatButton(
                                        child: Text(_profQues[index].answers[3].comment),
                                        onPressed: () => _profQues[index].answers[3].votes++,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                      },
                    );
                });
                }),

                Divider(
                  height: 8,
                  color: Colors.black,
                ),
                Text('Ask a Question'),
                TextField(
                  decoration: new InputDecoration.collapsed(
                      hintText: 'Enter Question'),
                  onSubmitted: (String text) {
                    _studQues.add(new Question());
                    _studQues.last.pointedQuestion = text;
            //        LecturesApi().lecturesPostQuestion(widget.lecture.id, QuestionCreate());
                  },
                )
                //Add the create a question

              ]);
            },

        ),
      ),
    ));
  }
}