import 'package:flutter/material.dart';
import 'package:pendiente_frontend_flutter/screens/sign_in/components/custom_input_field.dart';
import 'package:pendiente_frontend_flutter/screens/components/sign_button.dart';
import 'package:pendiente_frontend_flutter/screens/sign_in/components/sign_text.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = '/sign_up';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff212121),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Registro',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.red,
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.1,
            vertical: size.height * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'REGÍSTRATE',
                style: TextStyle(
                  color: Color(0xff666666),
                  fontWeight: FontWeight.w900,
                  fontSize: 34.0,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                'Ayudanos a conocerte más completando los siguientes campos',
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 22.0,
                  height: 1.4,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              CustomInputField(hintText: 'Nombres', isOscureText: false),
              SizedBox(height: size.height * 0.03),
              CustomInputField(hintText: 'Apellidos', isOscureText: false),
              SizedBox(height: size.height * 0.03),
              CustomInputField(hintText: 'Email', isOscureText: false),
              SizedBox(height: size.height * 0.03),
              CustomInputField(hintText: 'Contraseña', isOscureText: true),
              SizedBox(height: size.height * 0.05),
              SignButton(size: size, text: 'REGISTRAR', onPressed: () {}),
              SizedBox(height: size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¿Ya tienes cuenta? ',
                    style: TextStyle(
                      color: Color(0xff666666),
                      fontSize: 16.0,
                    ),
                  ),
                  SignText(text: 'Ingresa aquí', size: 16.0),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
