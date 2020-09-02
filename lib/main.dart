import 'package:flutter/material.dart';

import 'package:pendiente_frontend_flutter/screens/routes.dart';
import 'package:pendiente_frontend_flutter/shared-preferences/shared_preferences.dart';

import 'package:pendiente_frontend_flutter/screens/sign_in/sign_in_screen.dart';
import 'package:pendiente_frontend_flutter/screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new SharedPref();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = new SharedPref();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pendiente App',
      theme: ThemeData(
        primaryColor: Color(0xffFFF951),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute:
          prefs.isLoggedIn ? HomeScreen.routeName : SignInScreen.routeName,
      routes: routes,
    );
  }
}
