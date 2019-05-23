import 'package:flutter/material.dart';
import 'package:ila/config.dart';
import 'package:ila_swagger/api.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _isData = false;
  List<Course> _courses;

  @override
  void initState() {
    super.initState();

    CoursesApi().coursesGetMemberCourses().then((courses) {
      _courses = courses;
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
        title: Text(Config.AppTitle),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          )
        ],
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
                        "Courses",
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
                itemCount: _courses.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(_courses[index].title),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () => Navigator.of(context).pushNamed(
                      '/course',
                      arguments: _courses[index]),
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
          onPressed: ()
           => Navigator.of(context)
               .pushNamed('/addCourse')
               .then((_) => initState()),
      ),
    );
  }
}
