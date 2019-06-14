import 'package:flutter/material.dart';
import 'package:ila/views/course/addCourseView.dart';
import 'package:ila/views/course/courseView.dart';
import 'package:ila/views/course/lecture/AllQuestionsView.dart';
import 'package:ila/views/course/lecture/createQuestionAnswerView.dart';
import 'package:ila/views/course/lecture/createQuestionView.dart';
import 'package:ila/views/course/lecture/questionView.dart';
import 'package:ila/views/course/news/newsDetailsView.dart';
import 'package:ila/views/course/news/newsView.dart';
import 'package:ila/views/homeView.dart';
import 'package:ila/views/course/lecture/lectureView.dart';
import 'package:ila/views/loginView.dart';
import 'package:ila/views/registrationView.dart';
import 'package:ila/views/settings/settingsView.dart';
import 'package:ila_swagger/api.dart';
import 'package:ila/views/settings/dataPolicyView.dart';

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
      return HomeView();
    case '/login':
      return LoginView();
    case '/registration':
      return RegistrationView();
    case '/settings/dataPolicy':
      return DataPolicyView();
    case '/settings':
      return SettingsView();
    case '/course':
      Course course = arguments as Course;
      return CourseView(course);
    case '/lecture':
      Lecture lecture = arguments as Lecture;
      return LectureView(lecture);
    case '/lecture/question':
      Question question = arguments as Question;
      return QuestionView(question);
    case '/lecture/question/answers/new':
      Question question = arguments as Question;
      return CreateQuestionAnswerView(question);
    case '/lecture/question/new':
      Lecture lecture = arguments as Lecture;
      return CreateQuestionView(lecture);
    case '/quesDetails':
      Question ques = arguments as Question;
      return QuestionView(ques);
    case '/lecture/questions/all':
      List<Question> questions = arguments as List<Question>;
      return AllQuestionsView(questions);
    case '/newsDetails':
      CourseNews news = arguments as CourseNews;
      return NewsDetailsView(news);
    case '/news':
      List<CourseNews> news = arguments as List<CourseNews>;
      return NewsView(news);
    case '/addCourse':
      return AddCourseView();
    default:
      throw 'Route $routeName is not defined';
  }
}
