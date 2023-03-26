import 'dart:io';

import 'package:clean_mvvm/users_list/models/users_list_model.dart';
import 'package:clean_mvvm/users_list/repo/api_status.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';

class UserServices {
  static Future<Object?> getUsers() async {
    try {
      var url = Uri.parse(USERS_LIST);
      var response = await http.get(url);
      if (200 == response.statusCode) {
        return Success(
            code: response.statusCode,
            response: usersListModelFromJson(response.body));
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: "Invalis Response");
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: "No Internet");
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: "Invalid Format");
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
