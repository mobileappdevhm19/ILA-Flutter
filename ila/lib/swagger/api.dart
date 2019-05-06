library swagger.api;

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/oauth.dart';

part 'api/auth_api.dart';
part 'api/courses_api.dart';
part 'api/lectures_api.dart';

part 'model/auth_login_model.dart';
part 'model/auth_login_response.dart';
part 'model/auth_register_model.dart';
part 'model/auth_register_response.dart';
part 'model/body.dart';
part 'model/body1.dart';
part 'model/course_create_model.dart';
part 'model/course_model.dart';
part 'model/course_update_model.dart';
part 'model/courses_response_model.dart';
part 'model/generic_error_response.dart';
part 'model/lecture_create_model.dart';
part 'model/lecture_model.dart';
part 'model/lecture_update_model.dart';
part 'model/lecture_visible_model.dart';
part 'model/member_model.dart';
part 'model/token_model.dart';


ApiClient defaultApiClient = new ApiClient();
