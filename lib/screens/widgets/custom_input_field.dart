import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  CustomInputField({
    Key key,
    @required this.hintText,
    @required this.isOscureText,
  }) : super(key: key);

  final String hintText;
  final bool isOscureText;
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
    return TextFormField(
      obscureText: isOscureText,
      style: TextStyle(fontSize: 20.0),
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
        enabledBorder: underlineInputBorder,
        focusedBorder: focusedUnderlineInputBorder,
      ),
    );
  }
}
