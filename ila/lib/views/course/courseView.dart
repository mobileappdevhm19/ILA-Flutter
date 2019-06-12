import 'package:flutter/material.dart';
import 'package:ila/config.dart';
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
  bool _isDataNews = false;
  List<Lecture> _lectures;
  List<CourseNews> _news;

  @override
  void initState() {
    super.initState();

    widget.coursesApi.coursesGet(widget.course.id).then((course) {
      _news = course.news;
      setState(() {
        _isDataNews = true;
      });
    }).catchError((error) {
      print(error.toString());
      // TODO handle error
    });
    widget.lecturesApi.lecturesGetAll(widget.course.id).then((lectures) {
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
              padding: EdgeInsets.only(top: 15),
              child: Column(
                children: <Widget>[
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
                  _isDataNews
                      ? ListView.separated(
                          shrinkWrap: true,
                          itemCount: _news.length > 2 ? 2 : _news.length,
                          itemBuilder: (context, index) {
                            CourseNews newsItem = _news[index];
                            var subtitle = newsItem.body.substring(
                                    0,
                                    newsItem.body.length > 30
                                        ? 30
                                        : newsItem.body.length) +
                                "...";

                            return ListTile(
                              title: Text(newsItem.title),
                              subtitle: Text(subtitle),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () => Navigator.of(context).pushNamed(
                                    '/newsDetails',
                                    arguments: newsItem,
                                  ),
                            );
                          },
                          separatorBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0),
                              child: Divider(
                                height: 1,
                              )))
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
                                  arguments: _news,
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
                              child: Divider(
                                height: 5,
                              )),
                        )
                      : Center(child: CircularProgressIndicator())
                ],
              ),
            ),
      ),
    );
  }
}
