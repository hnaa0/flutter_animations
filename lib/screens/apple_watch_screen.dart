import 'dart:math';

import 'package:flutter/material.dart';

class AppleWatchScreen extends StatefulWidget {
  const AppleWatchScreen({super.key});

  @override
  State<AppleWatchScreen> createState() => _AppleWatchScreenState();
}

class _AppleWatchScreenState extends State<AppleWatchScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
    lowerBound: 0.002,
    upperBound: 2.0,
  );

  void _animateValues() {
    _animationController.forward();
  }

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
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return CustomPaint(
              painter: AppleWatchPainter(
                progress: _animationController.value,
              ),
              size: const Size(400, 400),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _animateValues,
        child: const Icon(
          Icons.refresh,
        ),
      ),
    );
  }
}

class AppleWatchPainter extends CustomPainter {
  final double progress;

  AppleWatchPainter({
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    const startingAngle = -0.5 * pi;

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

    final greenCircleRadius = (size.width / 2) * 0.76;

    canvas.drawCircle(
      Offset(size.width / 2, size.width / 2),
      greenCircleRadius,
      greenCirclePaint,
    );

    final blueCirclePaint = Paint()
      ..color = Colors.blue.shade900.withOpacity(0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25;

    final blueCircleRadius = (size.width / 2) * 0.62;

    canvas.drawCircle(
      Offset(size.width / 2, size.width / 2),
      blueCircleRadius,
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
      startingAngle,
      progress * pi,
      false,
      redArcPaint,
    );

    final greenArcRect = Rect.fromCircle(
      center: center,
      radius: greenCircleRadius,
    );

    final greenArcPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 25;

    canvas.drawArc(
      greenArcRect,
      startingAngle,
      progress * pi,
      false,
      greenArcPaint,
    );

    final blueArcRect = Rect.fromCircle(
      center: center,
      radius: blueCircleRadius,
    );

    final blueArcPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 25;

    canvas.drawArc(
      blueArcRect,
      startingAngle,
      progress * pi,
      false,
      blueArcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant AppleWatchPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
