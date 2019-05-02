import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ILA',
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

class State2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State2'),
      ),
    );
  }
}

class CoursesWidget extends StatelessWidget {
  final List<Course> items = [
    Course(title: 'Mobile App Development', description: 'Flutter Apps'),
    Course(title: 'Signal Processing', description: 'Digital Signal Systems'),
    Course(title: 'Autonomous Systems', description: 'Indoor Navigation'),
    Course(title: 'Multisensor Navigation', description: 'Navigation Algorithmen')
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // Let the ListView know how many items it needs to build
      itemCount: items.length,
      // Provide a builder function. This is where the magic happens! We'll
      // convert each item into a Widget based on the type of item it is.
      itemBuilder: (context, index) {
        final item = items[index];

        return ListTile(
          title: Text(item.title),
          subtitle: Text(item.description),
          onTap: () => onTapped(context, item),
        );
      },
    );
  }

  onTapped(BuildContext context, Course course) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => CourseWidget(course: course)));
  }
}

class Course {
  String title, description;

  Course({this.title, this.description});
}

class CourseWidget extends StatefulWidget {
  final Course course;

  CourseWidget({this.course, Key key}) : super(key: key);

  @override
  CourseWidgetState createState() => CourseWidgetState();
}

class CourseWidgetState extends State<CourseWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.widget.course.title),),
      body: Text(this.widget.course.title),
    );
  }
}
