library ila_swagger.api;

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';

part 'api/account_api.dart';
part 'api/courses_api.dart';
part 'api/lectures_api.dart';

part 'model/answer.dart';
part 'model/course.dart';
part 'model/course_create_upate_model.dart';
part 'model/course_member.dart';
part 'model/course_token.dart';
part 'model/identity_user_of_string.dart';
part 'model/json_web_token.dart';
part 'model/lecture.dart';
part 'model/lecture_create_update_model.dart';
part 'model/pause.dart';
part 'model/question.dart';
part 'model/sign_in.dart';
part 'model/sign_up.dart';
part 'model/identity_user.dart';
part 'model/ila_user.dart';


ApiClient defaultApiClient = new ApiClient();
