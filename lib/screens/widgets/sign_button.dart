import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  const SignButton({
    Key key,
    @required this.size,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  final Size size;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2.0,
            offset: Offset(0, 2),
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: FlatButton(
        onPressed: onPressed,
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
        child: Text(
          text,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
