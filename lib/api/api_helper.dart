import 'dart:io';

import 'package:newsapp/storage/shaerd_pref_controller.dart';

mixin ApiHelper {
  Map<String, String> get headers {
    Map<String, String> headers = <String, String>{};
    headers[HttpHeaders.acceptHeader] = 'application/json';
    if (SharedPrefController.sharedPrefController.loggedIn) {
      headers[HttpHeaders.authorizationHeader] = SharedPrefController().token;
    }
    return headers;
  }
}
