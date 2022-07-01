import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/enums/shared_pref_keys.dart';

class SharedPrefsManager {
  SharedPreferences? _preferences;
  static SharedPrefsManager? _instance;
  static SharedPrefsManager get instance => _instance ??= SharedPrefsManager._init();

  SharedPrefsManager._init();

  static Future preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> clearAll() async {
    await _preferences!.clear();
  }

  Future<void> setStringValue(SharedPrefKeys key, String value) async {
    await _preferences!.setString(key.name, value);
  }

  Future<void> setBoolValue(SharedPrefKeys key, {bool? value}) async {
    await _preferences!.setBool(key.name, value!);
  }

  String getStringValue(SharedPrefKeys key) => _preferences!.getString(key.name) ?? '';

  bool getBoolValue(SharedPrefKeys key) => _preferences!.getBool(key.name) ?? true;
}
