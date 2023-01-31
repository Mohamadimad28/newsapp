import 'package:newsapp/api/models/student_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { loggedIn, id, fullName, email, gender, token }

class SharedPrefController {
  static final SharedPrefController sharedPrefController =
      SharedPrefController._();
  late SharedPreferences sharedPreferences;

  factory SharedPrefController() {
    return sharedPrefController;
  }

  SharedPrefController._();

  Future<void> initPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save({required Student student}) async {
    await sharedPreferences.setBool(PrefKeys.loggedIn.toString(), true);
    await sharedPreferences.setInt(PrefKeys.id.toString(), student.id);
    await sharedPreferences.setString(
        PrefKeys.fullName.toString(), student.fullName);
    await sharedPreferences.setString(PrefKeys.email.toString(), student.email);
    await sharedPreferences.setString(
        PrefKeys.gender.toString(), student.gender);
    await sharedPreferences.setString(
        PrefKeys.token.toString(), 'Bearer ${student.token}');
  }

  bool get loggedIn =>
      sharedPreferences.getBool(PrefKeys.loggedIn.toString()) ?? false;

  String get token =>
      sharedPreferences.getString(PrefKeys.token.toString()) ?? '';

  String get email =>
      sharedPreferences.getString(PrefKeys.email.toString()) ?? '';

  Future<bool> clear() async => sharedPreferences.clear();
}
