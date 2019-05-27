import 'package:flutter/material.dart';
import 'package:ila/config.dart';
import 'package:ila_swagger/api.dart';
import 'package:ila/helpers/pauseButton.dart';

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
  TextEditingController _controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _load();
  }

   _load(){

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
                      PauseButton(
                          ws: <Widget>[
                            const Icon(
                              Icons.announcement,
                              color: Colors.white,
                              size: 34.0,
                            ),
                            Text('  Pause',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ))
                          ],
                          //TODO: Change Background Color into panic mode and out
                          //TODO: make new function above to pass it to button instance
                          //TODO: Reset Button
                          //TODO: pass new setState function to reset into initial State
                          func: () {
                            LecturesApi().lecturesPostPause(widget.lecture.id);
                            print('pausePressedMahDude');
                          }),

                      SizedBox(height: 16),
                      Divider(
                        height: 8,
                        color: Colors.black,
                      ),

                      Text('Questions Section'),

                      Divider(
                        height: 8,
                        color: Colors.black,
                      ),
                      Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const ListTile(
                              leading: Icon(Icons.library_books),
                              title: Text('Professors Questions'),
                              subtitle: Text('Questions for this Lecture:'),
                            ),
                            ListView(
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(20.0),
                              children: <Widget>[
                                const Text('I\'m dedicating every day to you'),
                                const Text(
                                    'Domestic life was never quite my style'),
                                const Text(
                                    'When you smile, you knock me out, I fall apart'),
                                const Text('And I thought I was so smart'),
                              ],
                            ),
                            ButtonTheme.bar(
                              // make buttons use the appropriate styles for cards
                              child: ButtonBar(
                                children: <Widget>[
                                  FlatButton(
                                    child: const Text('See all questions'),
                                    onPressed: () => Navigator.of(context)
                                        .pushNamed('/lecture',
                                            arguments: widget.lecture),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const ListTile(
                              leading: Icon(Icons.message),
                              title: Text('Student Questions'),
                              subtitle: Text(
                                  'The following Questions have  been asked:'),
                            ),
                            SizedBox(
                            width: 200.0,
                            height: 80.0,
                            child: ListView.builder(
                                itemCount: _profQues?.length ?? 0,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return FlatButton(
                                      child: Text('Question $index'),
                                      onPressed: () {showDialog(context: context,
                                      child:Card(
                                      child: Column(
                                          mainAxisSize:
                                          MainAxisSize.min,
                                          children: <Widget>[
                                          Text(_profQues[index].pointedQuestion,
                                          style: Theme.of(context)
                                          .textTheme
                                          .display1),]))

                                      );}
                                  );
                                }),
                            ),

                            ButtonTheme.bar(
                              // make buttons use the appropriate styles for cards
                              child: ButtonBar(
                                children: <Widget>[
                                  FlatButton(
                                    child: const Text('See all Questions'),
                                    onPressed: () {
                                      /* All StudentQuestionView */
                                    },
                                  ),
                                  FlatButton(
                                    child: const Text('Post New Question'),
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
                                                    child: ButtonBar(children: <
                                                        Widget>[
                                                  FlatButton(
                                                    child: const Text('Cancel'),
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
                                                      LecturesApi().lecturesPostQuestion(widget.lecture.id,
                                                          QuestionCreate.fromJson({"pointedQuestion": _controller.text}));
                                                      Navigator.of(context).pop();
                                                      this.initState();
                                                    },
                                                  ),
                                                ]))
                                              ])))
                                      .then((_){
                                        setState(() {
                                          _isData = false;
                                        });
                                       _load();
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]);
                  },
                ),
              ),
        ));
  }
}
