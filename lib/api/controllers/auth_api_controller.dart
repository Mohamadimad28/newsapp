import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/api/api_helper.dart';
import 'package:newsapp/api/api_settings.dart';
import 'package:newsapp/api/models/api_response_message_error.dart';
import 'package:newsapp/api/models/student_model.dart';
import 'package:newsapp/storage/shaerd_pref_controller.dart';

class AuthApiController with ApiHelper {
  /*login*/
  Future<ApiResponseMessage> login(
      {required String email, required String password}) async {
    var url = Uri.parse(ApiSettings.login);
    var response = await http.post(url, body: {
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var jsonObject = jsonResponse['object'];
        Student student = Student.fromJson(jsonObject);
        SharedPrefController.sharedPrefController.save(student: student);
      }
      return ApiResponseMessage(
          message: jsonResponse['message'], status: jsonResponse['status']);
    } else {
      return ApiResponseMessage(
          message: 'Something went wrong, try again', status: false);
    }
  }

  /**
   * login
   *if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonObject = jsonResponse['object'];
      Student student = Student.fromJson(jsonObject);
      SharedPrefController.sharedPrefController.save(student: student);
      return ApiResponseMessage(
      message: jsonResponse['message'], status: jsonResponse['status']);
      } else if (response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponseMessage(
      message: jsonResponse['message'], status: jsonResponse['status']);
      } else {
      return ApiResponseMessage(
      message: 'Something went wrong, try again', status: false);
      }*/

  /*LOGOUT*/
  Future<ApiResponseMessage> logout() async {
    var url = Uri.parse(ApiSettings.logout);
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 401) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return ApiResponseMessage(
            message: jsonResponse['message'], status: jsonResponse['status']);
      } else {
        return ApiResponseMessage(
            message: 'Logged Out successfully', status: true);
      }
    }
    return ApiResponseMessage(message: 'Something went wrong', status: false);
  }

  /*Register*/
  Future<ApiResponseMessage> register({required Student student}) async {
    var url = Uri.parse(ApiSettings.register);
    var response = await http.post(url, body: {
      'full_name': student.fullName,
      'email': student.email,
      'password': student.password,
      'gender': student.gender
    });
    if (response.statusCode == 201 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponseMessage(
        message: jsonResponse['message'],
        status: jsonResponse['status'],
      );
    }
    return ApiResponseMessage(
      message: 'Something went wrong',
      status: false,
    );
  }
}
