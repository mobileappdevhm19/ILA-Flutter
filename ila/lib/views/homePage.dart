import 'package:flutter/material.dart';
import 'package:ila/views/State2.dart';
import 'package:ila/views/courses/coursesWidget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    CoursesWidget(),
    null,
    Icon(Icons.threed_rotation),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interactive Lecture Assitent'),
      ),
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('Current Lecture'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            title: Text('Add Course'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('Settings'))
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    if (index == 1)
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => State2()));
    else
      setState(() {
        _currentIndex = index;
      });
  }
}
