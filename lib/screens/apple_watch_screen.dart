import 'dart:math';

import 'package:flutter/material.dart';

class AppleWatchScreen extends StatefulWidget {
  const AppleWatchScreen({super.key});

  @override
  State<AppleWatchScreen> createState() => _AppleWatchScreenState();
}

class _AppleWatchScreenState extends State<AppleWatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text(
          "Apple watch",
        ),
      ),
      body: Center(
        child: CustomPaint(
          painter: AppleWatchPainter(),
          size: const Size(400, 400),
        ),
      ),
    );
  }
}

class AppleWatchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final redCirclePaint = Paint()
      ..color = Colors.pink.shade900.withOpacity(0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25;

    final redCircleRadius = (size.width / 2) * 0.9;

    canvas.drawCircle(
      Offset(size.width / 2, size.width / 2),
      redCircleRadius,
      redCirclePaint,
    );

    final greenCirclePaint = Paint()
      ..color = Colors.green.shade900.withOpacity(0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25;

    canvas.drawCircle(
      Offset(size.width / 2, size.width / 2),
      (size.width / 2) * 0.76,
      greenCirclePaint,
    );

    final blueCirclePaint = Paint()
      ..color = Colors.blue.shade900.withOpacity(0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25;

    canvas.drawCircle(
      Offset(size.width / 2, size.width / 2),
      (size.width / 2) * 0.62,
      blueCirclePaint,
    );

    final redeArcRect = Rect.fromCircle(
      center: center,
      radius: redCircleRadius,
    );

    final redArcPaint = Paint()
      ..color = Colors.pink
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 25;

    canvas.drawArc(
      redeArcRect,
      -0.5 * pi,
      1.5 * pi,
      false,
      redArcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
