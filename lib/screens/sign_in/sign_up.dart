import 'package:flutter/material.dart';
import 'package:pendiente_frontend_flutter/model/donor_model.dart';
import 'package:pendiente_frontend_flutter/provider/campaign_list_provider.dart';
// import 'package:pendiente_frontend_flutter/screens/sign_in/components/custom_input_field.dart';
import 'package:pendiente_frontend_flutter/screens/components/sign_button.dart';
import 'package:pendiente_frontend_flutter/screens/sign_in/components/sign_text.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = '/sign_up';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final registerDonorProvider = new CampaignListProvider();
  String name, lastName, email, password;
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
              TextFormField(
                style: TextStyle(fontSize: 20.0),
                decoration: InputDecoration(
                  hintText: 'Nombres',
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  enabledBorder: underlineInputBorder,
                  focusedBorder: focusedUnderlineInputBorder,
                ),
                onChanged: (value) => name = value,
              ),
              SizedBox(height: size.height * 0.03),
              TextFormField(
                style: TextStyle(fontSize: 20.0),
                decoration: InputDecoration(
                  hintText: 'Apellidos',
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  enabledBorder: underlineInputBorder,
                  focusedBorder: focusedUnderlineInputBorder,
                ),
                onChanged: (value) => lastName = value,
              ),
              SizedBox(height: size.height * 0.03),
              TextFormField(
                style: TextStyle(fontSize: 20.0),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  enabledBorder: underlineInputBorder,
                  focusedBorder: focusedUnderlineInputBorder,
                ),
                onChanged: (value) => email = value,
              ),
              SizedBox(height: size.height * 0.03),
              TextFormField(
                obscureText: true,
                style: TextStyle(fontSize: 20.0),
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  enabledBorder: underlineInputBorder,
                  focusedBorder: focusedUnderlineInputBorder,
                ),
                onChanged: (value) => password = value,
              ),
              SizedBox(height: size.height * 0.05),
              SignButton(
                  size: size,
                  text: 'REGISTRAR',
                  onPressed: () async {
                    Donor donor = new Donor(
                      name: name,
                      lastName: lastName,
                      email: email,
                      password: password,
                    );

                    final response =
                        await registerDonorProvider.postRegister(donor);
                    response != null ? Navigator.pop(context) : print('Error');
                  }),
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
