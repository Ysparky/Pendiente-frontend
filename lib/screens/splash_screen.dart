import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pendiente_frontend_flutter/screens/sign_in/sign_in.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      nextPageNavigator,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Theme.of(context).primaryColor,
        child: Image.network(
          'https://scontent.flim20-1.fna.fbcdn.net/v/t1.0-9/61875635_894022220964573_6336480648970108928_n.png?_nc_cat=110&_nc_sid=09cbfe&_nc_eui2=AeEXqpMCzLmNhTd7fymL7uTm-cZ9YTX11rX5xn1hNfXWtbVBLHSb1BrTjtUPuGmKWpvIn5hI4Qmxyi0sBAY-GHxx&_nc_ohc=MufQIqtdVjEAX8iZ6Yv&_nc_ht=scontent.flim20-1.fna&oh=ae634f5465648f4e7de1954fe2d6a251&oe=5F51D78B',
          height: 350,
        ),
      ),
    );
  }

  FutureOr<dynamic> nextPageNavigator() {
    Navigator.popAndPushNamed(context, SignInScreen.routeName);
  }
}
