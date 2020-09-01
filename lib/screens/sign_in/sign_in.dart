import 'package:flutter/material.dart';
import 'package:pendiente_frontend_flutter/provider/campaign_list_provider.dart';
import 'package:pendiente_frontend_flutter/screens/home/home_screen.dart';
import 'package:progress_dialog/progress_dialog.dart';
// import 'package:pendiente_frontend_flutter/screens/sign_in/components/custom_input_field.dart';
import 'package:pendiente_frontend_flutter/screens/components/sign_button.dart';
import 'package:pendiente_frontend_flutter/screens/sign_in/components/sign_text.dart';
import 'package:pendiente_frontend_flutter/screens/sign_in/components/triangle_painter.dart';
import 'package:pendiente_frontend_flutter/screens/sign_in/sign_up.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = '/sign_in';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  ProgressDialog progressDialog;
  final loginProvider = new CampaignListProvider();
  final underlineInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xffEFC426),
      width: 2.0,
    ),
  );

  final focusedUnderlineInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xffEFC426),
      width: 4.0,
    ),
  );

  String userValue;

  String passwordValue;

  @override
  Widget build(BuildContext context) {
    progressDialog = ProgressDialog(context, isDismissible: false);
    progressDialog.style(
      message: 'Cargando',
      progressWidget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(),
      ),
    );
    final size = MediaQuery.of(context).size;
    var logoImage = Positioned(
      top: 0,
      left: 0,
      child: Container(
        height: size.height * 0.3,
        width: size.width * 0.75,
        child: Image.asset(
          'assets/images/pendiente_logo_wbg-removebg.png',
          fit: BoxFit.cover,
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            TriangleShape(size: size),
            logoImage,
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: size.height * 0.55,
                width: size.width,
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(fontSize: 20.0),
                        decoration: InputDecoration(
                          hintText: 'Usuario',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                          enabledBorder: underlineInputBorder,
                          focusedBorder: focusedUnderlineInputBorder,
                        ),
                        onChanged: (value) => userValue = value,
                      ),
                      SizedBox(height: size.height * 0.05),
                      TextFormField(
                        obscureText: true,
                        style: TextStyle(fontSize: 20.0),
                        decoration: InputDecoration(
                          hintText: 'Contraseña',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                          enabledBorder: underlineInputBorder,
                          focusedBorder: focusedUnderlineInputBorder,
                        ),
                        onChanged: (value) => passwordValue = value,
                      ),
                      SizedBox(height: size.height * 0.05),
                      SignText(text: 'Recuperar contraseña', size: 18.0),
                      SizedBox(height: size.height * 0.05),
                      Builder(
                        builder: (context) => SignButton(
                          size: size,
                          text: 'Iniciar Sesión',
                          onPressed: () async {
                            await progressDialog.show();
                            final donor = await loginProvider.postLogin(
                                userValue, passwordValue);
                            await progressDialog.hide();
                            donor != null
                                ? Navigator.popAndPushNamed(
                                    context,
                                    HomeScreen.routeName,
                                    arguments: donor,
                                  )
                                : Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text('Ha ocurrido un error')));
                          },
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: size.width * 0.032),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '¿No tienes una cuenta?, ',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.0,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, SignUpScreen.routeName);
                              },
                              child: SignText(text: 'Regístrate', size: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
