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

  get donorImage {
    return _prefs.getString('donorImage') ??
        'assets/images/pendiente_logo_wbg-removebg.png';
  }

  set donorImage(String path) {
    _prefs.setString('donorImage', path);
  }

  get donorName {
    return _prefs.getString('donorName') ?? 'Name';
  }

  set donorName(String name) {
    _prefs.setString('donorName', name);
  }

  get donorEmail {
    return _prefs.getString('donorEmail') ?? 'help@gmail.com';
  }

  set donorEmail(String email) {
    _prefs.setString('donorEmail', email);
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
