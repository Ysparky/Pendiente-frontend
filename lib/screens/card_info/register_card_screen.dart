import 'package:flutter/material.dart';
import 'package:pendiente_frontend_flutter/screens/widgets/sign_button.dart';
import 'package:pendiente_frontend_flutter/screens/widgets/custom_input_field.dart';

class RegisterCardScreeen extends StatelessWidget {
  static String routeName = '/register_card';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff212121),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Tarjeta de Crédito',
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
                'COLABORA',
                style: TextStyle(
                  color: Color(0xff666666),
                  fontWeight: FontWeight.w900,
                  fontSize: 34.0,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                'Agrega tu tarjeta preferida completando los siguientes campos.',
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 22.0,
                  height: 1.4,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              CustomInputField(
                  hintText: 'Nombre del Titular', isOscureText: false),
              SizedBox(height: size.height * 0.03),
              CustomInputField(
                  hintText: 'Número de Tarjeta', isOscureText: false),
              SizedBox(height: size.height * 0.03),
              CustomInputField(
                  hintText: 'Fecha de Caducidad', isOscureText: false),
              SizedBox(height: size.height * 0.03),
              CustomInputField(hintText: 'CVV', isOscureText: true),
              SizedBox(height: size.height * 0.05),
              SignButton(size: size, text: 'AGREGAR', onPressed: () {}),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
