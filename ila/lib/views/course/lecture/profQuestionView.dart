import 'package:flutter/material.dart';
import 'package:ila/config.dart';
import 'package:ila_swagger/api.dart';
import 'package:ila/widgets/ilaToast.dart';


class ProfQuestionView extends StatefulWidget {
  final ProfQuestion question;

  const ProfQuestionView(this.question);

  @override
  _ProfQuestionViewState createState() => _ProfQuestionViewState();
}

class _ProfQuestionViewState extends State<ProfQuestionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Professor Question')),
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                        "Professor Question",
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
                      widget.question.question,
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
                    "Answer Choices",
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
                    child: ListTile(
                      title: Text(widget.question.answers[index].answer),
                      onTap: () => {ILAToast.of(context).showToast(
                      toastType: ToastType.info,
                      message: 'You pushed answer'+widget.question.answers[index].id.toString(),
                      )},

                    ),
                  ),
                ),
            separatorBuilder: (context, index) => Divider(),
          ),
        ],
      ),
    );
  }
}
