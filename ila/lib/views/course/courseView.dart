import 'package:flutter/material.dart';
import 'package:ila/config.dart';
import 'package:ila/helpers/userException.dart';
import 'package:ila/main.dart';
import 'package:ila_swagger/api.dart';

class CourseView extends StatefulWidget {
  Course course;

  CourseView(this.course);

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

    coursesApi.coursesGet(widget.course.id).then((course) {
      this.widget.course = course;
      setState(() {
        _isDataCourse = true;
      });
    }).catchError((error) {
      print(error.toString());
      // TODO handle error
    });
    lecturesApi.lecturesGetAll(widget.course.id).then((lectures) {
      _lectures = lectures;
      setState(() {
        _isDataLectures = true;
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
                padding: EdgeInsets.only(top: 15, left: 10.0, right: 10.0),
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
                    _buildNews(context),
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
                    _buildLectures(context),
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

  _buildNews(BuildContext context) {
    return _isDataCourse
        ? ListView.builder(
            shrinkWrap: true,
            itemCount:
                widget.course.news.length > 2 ? 2 : widget.course.news.length,
            itemBuilder: (context, index) {
              CourseNews newsItem = widget.course.news[index];
              var subtitle = newsItem.body.substring(0,
                      newsItem.body.length > 30 ? 30 : newsItem.body.length) +
                  "...";

              return Padding(
                padding: EdgeInsets.only(bottom: 9.0, top: 1.0),
                child: Material(
                  elevation: Config.ShadowHeigth,
                  borderRadius: BorderRadius.circular(4.0),
                  shadowColor: Config.ShadowColor,
                  child: InkWell(
                    // Do onTap() if it isn't null, otherwise do print()
                    onTap: () => Navigator.of(context).pushNamed(
                          '/newsDetails',
                          arguments: newsItem,
                        ),
                    child: ListTile(
                      title: Text(newsItem.title),
                      subtitle: Text(subtitle),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                  ),
                ),
              );
            })
        : Center(child: CircularProgressIndicator());
  }

  _buildLectures(BuildContext context) {
    return _isDataLectures
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: _lectures.length,
            itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(bottom: 9.0, top: 1.0),
                child: Material(
                    elevation: Config.ShadowHeigth,
                    borderRadius: BorderRadius.circular(4.0),
                    shadowColor: Config.ShadowColor,
                    child: InkWell(
                        // Do onTap() if it isn't null, otherwise do print()
                        onTap: () => Navigator.of(context)
                            .pushNamed('/lecture', arguments: _lectures[index]),
                        child: ListTile(
                          title: Text(_lectures[index].title),
                          trailing: Icon(Icons.keyboard_arrow_right),
                        )))),
          )
        : Center(child: CircularProgressIndicator());
  }

  _leaveButtonOnPressed(BuildContext context) async {
    coursesApi.coursesLeave(widget.course.id).then((_) async {
      Navigator.pushNamed(context, '/home');
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Course Removed'),
        duration: Duration(seconds: 4),
      ));
    }).catchError((e) {
      print(e.toString());
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(e is UserException
            ? (e as UserException).message
            : 'Unbekannter Fehler ist aufgetretten'),
        duration: Duration(seconds: 4),
      ));
    });
  }
}
