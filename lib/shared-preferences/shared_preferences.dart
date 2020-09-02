import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static final SharedPref _instance = new SharedPref._internal();

  factory SharedPref() {
    return _instance;
  }

  SharedPref._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get donorId {
    return _prefs.getInt('donorId') ?? 0;
  }

  set donorId(int donorId) {
    _prefs.setInt('donorId', donorId);
  }

  get basketId {
    return _prefs.getInt('basketId') ?? 0;
  }

  set basketId(int basketId) {
    _prefs.setInt('basketId', basketId);
  }

  get isLoggedIn {
    return _prefs.getBool('isLoggedIn') ?? false;
  }

  set isLoggedIn(bool isLogged) {
    _prefs.setBool('isLoggedIn', isLogged);
  }

  void removeAll() {
    _prefs.remove('basketId');
    _prefs.remove('donorId');
  }

  void remove(String key) {
    _prefs.remove(key);
  }
}
