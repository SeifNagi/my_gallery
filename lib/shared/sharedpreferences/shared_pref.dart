import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? _sharedPreferences;

  static initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static saveToken(String token) async {
    await _sharedPreferences!.setString('tokenKey', token);
  }

  static String? getToken() {
    return _sharedPreferences!.getString('tokenKey');
  }

  static saveUserName(String name) async {
    await _sharedPreferences!.setString('userNameKey', name);
  }

  static String? getUserName() {
    return _sharedPreferences!.getString('userNameKey');
  }
}
