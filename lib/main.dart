import 'package:flutter/material.dart';
import 'package:pendiente_frontend_flutter/screens/campaign_detail/campaign_detail_screen.dart';
import 'package:pendiente_frontend_flutter/screens/card_info/register_card_screen.dart';
import 'package:pendiente_frontend_flutter/screens/home/home_screen.dart';
import 'package:pendiente_frontend_flutter/screens/sign_in/sign_in.dart';
import 'package:pendiente_frontend_flutter/screens/sign_in/sign_up.dart';
import 'package:pendiente_frontend_flutter/screens/splash_screen.dart';
import 'package:pendiente_frontend_flutter/shared-preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new SharedPref();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pendiente App',
      theme: ThemeData(
        primaryColor: Color(0xffFFF951),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        SignInScreen.routeName: (context) => SignInScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        CampaignDetailScreen.routeName: (context) => CampaignDetailScreen(),
        RegisterCardScreeen.routeName: (context) => RegisterCardScreeen(),
      },
    );
  }
}
