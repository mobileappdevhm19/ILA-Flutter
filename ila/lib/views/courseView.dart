import 'package:flutter/material.dart';
import 'package:ila/config.dart';
import 'package:ila_swagger/api.dart';

class CourseView extends StatefulWidget {
  Course course;

  CourseView({this.course});


  @override
  _CourseViewState createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  bool _isData = false;
  List<Lecture> _lectures;

  @override
  void initState() {
    super.initState();

    LecturesApi().lecturesGetMemberLectures(widget.course.id).then((lectures) {
      _lectures = lectures;
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
        title: Text(widget.course.title),
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
                        "Lectures",
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
                itemCount: _lectures.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(_lectures[index].title),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () => Navigator.of(context).pushNamed(
                      '/lecture',
                      arguments: _lectures[index]),
                ),
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0),
                  child: Divider(),
                ),
              )
                  : Center(child: CircularProgressIndicator())
            ],
          ),
        ),
      ),
    );
  }
}