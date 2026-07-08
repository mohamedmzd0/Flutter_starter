import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter/core/pref/SharedPref.dart';

class SharedPrefImpl extends SharedPref {
  final SharedPreferences prefs;
  SharedPrefImpl(this.prefs);

  static const _tokenKey = "token";

  @override
  String? getToken() {
    return prefs.getString(_tokenKey);
  }

  @override
  Future<void> removeToken() async {
    prefs.remove(_tokenKey);
  }

  @override
  Future<void> saveToken(String token) async {
    prefs.setString(_tokenKey, token);
  }

}
