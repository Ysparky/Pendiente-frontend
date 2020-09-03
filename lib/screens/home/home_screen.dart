import 'package:flutter/material.dart';

import 'package:pendiente_frontend_flutter/shared-preferences/shared_preferences.dart';

import 'package:pendiente_frontend_flutter/screens/campaigns/campaigns_screen.dart';
import 'package:pendiente_frontend_flutter/screens/favorite_campaigns/donations_page.dart';
import 'package:pendiente_frontend_flutter/screens/profile/profile_screen.dart';
import 'package:pendiente_frontend_flutter/screens/sign_in/sign_in_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final prefs = new SharedPref();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          'assets/images/pendiente_logo_wbg-removebg.png',
          height: size.height * 0.15,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('${prefs.donorName}'),
              accountEmail: Text(prefs.donorEmail),
              currentAccountPicture: CircleAvatar(
                  backgroundImage:
                      prefs.donorImage.toString().contains('assets/images')
                          ? AssetImage('assets/images/profile-placeholder.png')
                          : NetworkImage(prefs.donorImage)),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            Spacer(),
            Divider(thickness: 1.0, height: 0),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Salir'),
              onTap: () {
                Navigator.pop(context);
                Navigator.popAndPushNamed(context, SignInScreen.routeName);
                prefs.isLoggedIn = false;
                prefs.removeAll();
              },
            )
          ],
        ),
      ),
      body: _callPage(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10.0,
        currentIndex: _currentIndex,
        selectedItemColor: Color(0xffFF8E8E),
        unselectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Buscar'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text('Donaciones'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            title: Text('Favoritos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Perfil'),
          ),
        ],
      ),
    );
  }

  Widget _callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return CampaignsScreen();
      case 1:
        return Center(child: Text('Seatch'));
      case 2:
        return DonationsScreen();
      case 3:
        return Center(child: Text('Favorites'));
      case 4:
        return ProfileScreen();
      default:
        return CampaignsScreen();
    }
  }
}
