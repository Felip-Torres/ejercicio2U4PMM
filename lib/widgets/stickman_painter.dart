import 'package:flutter/material.dart';

class StickmanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    // Head
    canvas.drawCircle(
      Offset(size.width / 2, size.height * 0.2),
      20,
      paint,
    );

    // Body
    canvas.drawLine(
      Offset(size.width / 2, size.height * 0.2 + 20),
      Offset(size.width / 2, size.height * 0.6),
      paint,
    );

    // Arms
    canvas.drawLine(
      Offset(size.width / 2, size.height * 0.35),
      Offset(size.width * 0.2, size.height * 0.45),
      paint,
    );
    canvas.drawLine(
      Offset(size.width / 2, size.height * 0.35),
      Offset(size.width * 0.8, size.height * 0.45),
      paint,
    );

    // Legs
    canvas.drawLine(
      Offset(size.width / 2, size.height * 0.6),
      Offset(size.width * 0.2, size.height * 0.9),
      paint,
    );
    canvas.drawLine(
      Offset(size.width / 2, size.height * 0.6),
      Offset(size.width * 0.8, size.height * 0.9),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}