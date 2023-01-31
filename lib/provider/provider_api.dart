import 'package:flutter/material.dart';
import 'package:newsapp/api/controllers/auth_api_controller.dart';
import 'package:newsapp/api/controllers/news_api_controller.dart';
import 'package:newsapp/api/models/api_response_message_error.dart';
import 'package:newsapp/api/models/news_api.dart';
import 'package:newsapp/api/models/student_model.dart';
import 'package:newsapp/auth/login_screen.dart';
import 'package:newsapp/router/app_router.dart';
import 'package:newsapp/screens/main_screen.dart';
import 'package:newsapp/storage/shaerd_pref_controller.dart';

class ApiProvider extends ChangeNotifier {
  ApiProvider() {
    SharedPrefController.sharedPrefController.initPreferences().then((value) {
      checkUser();
    });
  }

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPassWordController = TextEditingController();
  TextEditingController registerFullNameController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  String gender = "M";
  Future<List<Articles>> future =
      NewsApiController.newsApiController.readNews();
  Future<List<Articles>> futureEntertainment =
      NewsApiController.newsApiController.readNewsEntertainment();
  List<Articles> newsListBusiness = [];
  List<Articles> newsListEntertainment = [];
  List<Articles> newsListSport = [];
  List<Articles> newsListTechnology = [];
  List<Articles> newsListHealth = [];

// readNewsProvider() async {
//   List<Articles> readUser =
//       await NewsApiController.newsApiController.readNews();
//   newsList = readUser;
//   print('readUser===' + readUser.length.toString());
//   notifyListeners();
// }
/*LogIN*/
  Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (loginEmailController.text.isNotEmpty &&
        loginPassWordController.text.isNotEmpty) {
      return true;
    }
    AppRouter.showSnackBar(message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> login() async {
    //TODO:Execute API Login Request HERE
    ApiResponseMessage apiResponseMessage = await AuthApiController().login(
        email: loginEmailController.text,
        password: loginPassWordController.text);
    AppRouter.showSnackBar(
        message: apiResponseMessage.message, error: !apiResponseMessage.status);

    if (apiResponseMessage.status) {
      //TODO:GO TO HOME SCREEN
      AppRouter.goAndReplaceScreen(const MainScreen());
    }
  }

/*LogIN*/
/*LogOut*/
  Future<void> logout() async {
    ApiResponseMessage apiResponseMessage = await AuthApiController().logout();
    AppRouter.showSnackBar(
        message: apiResponseMessage.message, error: !apiResponseMessage.status);
    if (apiResponseMessage.status) {
      SharedPrefController.sharedPrefController.clear();
      AppRouter.goAndReplaceScreen(const LoginScreen());
    }
  }

/*LogOut*/

/*Register*/
  Future<void> performRegister() async {
    if (checkDataRegister()) {
      await register();
    }
  }

  bool checkDataRegister() {
    if (registerFullNameController.text.isNotEmpty &&
        registerEmailController.text.isNotEmpty &&
        registerPasswordController.text.isNotEmpty) {
      return true;
    }
    AppRouter.showSnackBar(message: 'Enter required data!', error: true);
    return false;
  }

  // ignore: non_constant_identifier_names
  Future<void> register() async {
    //TODO:Execute API Register Request HERE
    ApiResponseMessage apiResponseMessage =
        await AuthApiController().register(student: student);
    if (apiResponseMessage.status) {
      AppRouter.goPopScreen();
    }
    AppRouter.showSnackBar(
        message: apiResponseMessage.message, error: !apiResponseMessage.status);
  }

  /*Register*/

  Student get student {
    Student student = Student();
    student.fullName = registerFullNameController.text;
    student.email = registerEmailController.text;
    student.password = registerPasswordController.text;
    student.gender = gender;
    return student;
  }

  /// ********/
  checkUser() async {
    await Future.delayed(const Duration(seconds: 3));
    SharedPrefController().loggedIn
        ? AppRouter.goAndReplaceScreen(const MainScreen())
        : AppRouter.goAndReplaceScreen(
            const LoginScreen(),
          );
  }
}
