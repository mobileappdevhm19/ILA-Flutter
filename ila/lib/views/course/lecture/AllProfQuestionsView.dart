import 'package:flutter/material.dart';
import 'package:ila_swagger/api.dart';
import 'package:ila/widgets/ilaToast.dart';

class AllProfQuestionsView extends StatefulWidget {
  ProfessorQuestionWrapper wrapper;
  Lecture lecture;
  ProfQuestionApi questionApi;
  AllProfQuestionsView(this.wrapper);


  @override
  _AllProfQuestionsViewState createState() => _AllProfQuestionsViewState();


}




class _AllProfQuestionsViewState extends State<AllProfQuestionsView> {
  bool _profQuestionsIsData = false;
  List<ProfQuestion> _professorQuestions;

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() {
    widget.lecture=widget.wrapper.lecture;
    widget.questionApi=widget.wrapper.questionApi;
    widget.wrapper.questionApi.profQuestionGet(widget.lecture.id).then((questions) {
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
    return Scaffold(
        appBar: AppBar(
          title: Text('All Professor Questions'),
        ),
        body: ListView.separated(
          key: ValueKey('allQuestionsList'),
            shrinkWrap: true,
            itemCount: _professorQuestions.length,
            itemBuilder: (context, index) {
              ProfQuestion ques = _professorQuestions[index];
              var subtitle = ques.question.substring(
                  0,
                  ques.question.length > 30
                      ? 30
                      : ques.question.length) +
                  "...";

              return ListTile(
                title: Text(ques.question),
                subtitle: Text(subtitle),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () => Navigator.of(context).pushNamed(
                  '/lecture/profQuestion',
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

class ProfessorQuestionWrapper {
  final Lecture lecture;
  final ProfQuestionApi questionApi;
  ProfessorQuestionWrapper(this.lecture,this.questionApi);
}
