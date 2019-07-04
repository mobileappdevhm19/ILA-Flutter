import 'package:flutter/material.dart';
import 'package:ila/config.dart';
import 'package:ila/helpers/userException.dart';
import 'package:ila/widgets/ilaToast.dart';
import 'package:ila_swagger/api.dart';

class CourseView extends StatefulWidget {
  Course course;
  CoursesApi coursesApi;
  LecturesApi lecturesApi;

  CourseView(this.course, this.coursesApi, this.lecturesApi);

  @override
  _CourseViewState createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  bool _isDataLectures = false;
  bool _isDataCourse = false;
  List<Lecture> _lectures;

  @override
  void initState() {
    super.initState();

    widget.coursesApi.coursesGet(widget.course.id).then((course) {
      this.widget.course = course;
      setState(() {
        _isDataCourse = true;
      });
    }).catchError((error) {
      print(error.toString());
      // TODO: remote logging
      ILAToast.of(context).showToast(
        toastType: ToastType.error,
        message: 'Fehler ist aufgetretten',
      );
    });
    widget.lecturesApi.lecturesGetAll(widget.course.id).then((lectures) {
      _lectures = lectures;
      setState(() {
        _isDataLectures = true;
      });
    }).catchError((error) {
      print(error.toString());
      // TODO: remote logging
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
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              widget.course.description,
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Text(
                              "News",
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
                        height: 10.0,
                      ),
                    ),
                    _isDataCourse
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.course.news.length > 2
                                ? 2
                                : widget.course.news.length,
                            itemBuilder: (context, index) {
                              CourseNews newsItem = widget.course.news[index];
                              var subtitle = newsItem.body.substring(
                                      0,
                                      newsItem.body.length > 30
                                          ? 30
                                          : newsItem.body.length) +
                                  "...";

                              return Card(
                                child: Container(
                                  child: ListTile(
                                    title: Text(newsItem.title),
                                    subtitle: Text(subtitle),
                                    trailing: Icon(Icons.keyboard_arrow_right),
                                    onTap: () =>
                                        Navigator.of(context).pushNamed(
                                          '/newsDetails',
                                          arguments: newsItem,
                                        ),
                                  ),
                                ),
                              );
                            })
                        : Center(child: CircularProgressIndicator()),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, bottom: 10),
                            child: GestureDetector(
                              child: Text("Show all news",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.blue)),
                              onTap: () => Navigator.of(context).pushNamed(
                                    '/news',
                                    arguments: widget.course.news,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
                        height: 10.0,
                      ),
                    ),
                    _isDataLectures
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: _lectures.length,
                            itemBuilder: (context, index) => Card(
                                    child: Container(
                                        child: ListTile(
                                  title: Text(_lectures[index].title),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () => Navigator.of(context).pushNamed(
                                      '/lecture',
                                      arguments: _lectures[index]),
                                ))),
                          )
                        : Center(child: CircularProgressIndicator())
                  ],
                ),
              ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.remove),
          onPressed: () => showDialog(
              context: context,
              child: AlertDialog(
                  title: new Text("Leave Course", textAlign: TextAlign.center),
                  content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new FlatButton(
                            onPressed: () => _leaveButtonOnPressed(context),
                            child: new Text("Confirm")),
                        new FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: new Text("Cancel")),
                      ]))),
        ));
  }

  _leaveButtonOnPressed(BuildContext context) async {
    widget.coursesApi.coursesLeave(widget.course.id).then((_) async {
      Navigator.pushNamed(context, '/home');
      ILAToast.of(context).showToast(
        toastType: ToastType.info,
        message: 'Course Removed',
      );
    }).catchError((e) {
      print(e.toString());
      ILAToast.of(context).showToast(
        toastType: ToastType.error,
        message: e is UserException
            ? (e as UserException).message
            : 'Unbekannter Fehler ist aufgetretten',
      );
    });
  }
}
