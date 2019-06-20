import 'package:flutter/material.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:ila_swagger/api.dart';

class AllQuestionsView extends StatefulWidget {
  List<Question> questions;

  AllQuestionsView(this.questions);

  @override
  _AllQuestionsViewState createState() => _AllQuestionsViewState();
}

class _AllQuestionsViewState extends State<AllQuestionsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Questions'),
        ),
        body: ListView.separated(
          key: ValueKey('allQuestionsList'),
            shrinkWrap: true,
            itemCount: widget.questions.length,
            itemBuilder: (context, index) {
              Question ques = widget.questions[index];
              var subtitle = ques.pointedQuestion.substring(
                  0,
                  ques.pointedQuestion.length > 30
                      ? 30
                      : ques.pointedQuestion.length) +
                  "...";

              return ListTile(
                title: Text(ques.pointedQuestion),
                subtitle: Text(subtitle),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () => Navigator.of(context).pushNamed(
                  '/quesDetails',
                  arguments: ques,
                ),
              );
            },
            separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0),
                child: Divider(
                  height: 1,
                )))
    );
  }
}
