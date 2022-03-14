import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static late SharedPreferences sharedPreferences;

  static initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> putBooleanSharedPreferences(
      {required String key, required bool value}) async {
    return await sharedPreferences.setBool(key, value);
  }

  bool? getBooleanSharedPreferences({required key}) {
    return sharedPreferences.getBool(key);
  }
}
