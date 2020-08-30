import 'package:flutter/material.dart';

class SignText extends StatelessWidget {
  const SignText({
    @required this.text,
    @required this.size,
    Key key,
  }) : super(key: key);

  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
        color: Colors.blue,
        decoration: TextDecoration.underline,
        fontSize: this.size,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
