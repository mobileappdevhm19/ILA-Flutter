import 'package:flutter/material.dart';
import 'package:ila/config.dart';
import 'package:ila_swagger/api.dart';

class QuestionView extends StatefulWidget {
  final Question question;

  const QuestionView(this.question);

  @override
  _QuestionViewState createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Question')),
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    "Question",
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
          Card(
            child: Container(
              margin: new EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 6.0),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      widget.question.pointedQuestion,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    "Answers",
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
          ListView.separated(
            shrinkWrap: true,
            itemCount: widget.question.answers.length,
            itemBuilder: (context, index) => Card(
                  child: Container(
                    margin: new EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 4.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 2.0, vertical: 6.0),
                    child: Column(
                      children: <Widget>[
                        Text(widget.question.answers[index].comment),
                      ],
                    ),
                  ),
                ),
            separatorBuilder: (context, index) => Divider(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.of(context)
              .pushNamed('/lecture/question/answers/new', arguments: widget.question)),
    );
  }
}
