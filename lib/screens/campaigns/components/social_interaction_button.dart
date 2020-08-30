import 'package:flutter/material.dart';

class SocialInteractionButton extends StatelessWidget {
  const SocialInteractionButton({
    Key key,
    @required this.interactionText,
    @required this.interactionIcon,
    this.interactionColor = Colors.black,
    @required this.onTap,
  }) : super(key: key);
  final String interactionText;
  final IconData interactionIcon;
  final Color interactionColor;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: size.height * 0.035,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(interactionIcon, size: 18.0, color: interactionColor),
              SizedBox(width: size.width * 0.006),
              Text(
                interactionText,
                style: TextStyle(fontSize: 12.0, color: interactionColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
