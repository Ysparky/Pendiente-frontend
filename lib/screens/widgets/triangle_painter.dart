import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..color = Color(0xffFFF951)
      ..style = PaintingStyle.fill;

    final path = new Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height * 0.15)
      ..lineTo(0, size.height * 0.5)
      ..lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) => true;
}

class TriangleShape extends StatelessWidget {
  const TriangleShape({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: double.infinity,
      child: CustomPaint(
        painter: TrianglePainter(),
      ),
    );
  }
}
