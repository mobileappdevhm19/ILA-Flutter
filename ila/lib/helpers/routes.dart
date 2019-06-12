import 'package:flutter/material.dart';
import 'package:ila/views/course/addCourseView.dart';
import 'package:ila/views/course/courseView.dart';
import 'package:ila/views/course/news/newsDetailsView.dart';
import 'package:ila/views/course/news/newsView.dart';
import 'package:ila/views/homeView.dart';
import 'package:ila/views/course/lecture/lectureView.dart';
import 'package:ila/views/loginView.dart';
import 'package:ila/views/registrationView.dart';
import 'package:ila/views/settings/settingsView.dart';
import 'package:ila_swagger/api.dart';
import 'package:ila/views/settings/dataPolicy.dart';

Widget makeRoute(
    {@required BuildContext context,
    @required String routeName,
    Object arguments}) {
  final Widget child =
      _buildRoute(context: context, routeName: routeName, arguments: arguments);
  return child;
}

Widget _buildRoute({
  @required BuildContext context,
  @required String routeName,
  Object arguments,
}) {
  switch (routeName) {
    case '/home':
      return HomeView(CoursesApi());
    case '/login':
      return LoginView();
    case '/registration':
      return RegistrationView(accountApi: AccountApi());
    case '/settings/dataPolicy':
      return DataPolicyView();
    case '/settings':
      return SettingsView();
    case '/course':
      Course course = arguments as Course;
      return CourseView(course, CoursesApi(), LecturesApi());
    case '/lecture':
      Lecture lecture = arguments as Lecture;
      return LectureView(lecture: lecture);
    case '/newsDetails':
      CourseNews news = arguments as CourseNews;
      return NewsDetailsView(news: news);
    case '/news':
      List<CourseNews> news = arguments as List<CourseNews>;
      return NewsView(news: news);
    case '/addCourse':
      return AddCourseView(CoursesApi());
    default:
      throw 'Route $routeName is not defined';
  }
}
