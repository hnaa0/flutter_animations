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
  )..forward();

  double _randomValue() {
    return Random().nextDouble() * 2.0;
  }

  late final CurvedAnimation _curve = CurvedAnimation(
    parent: _animationController,
    curve: Curves.bounceOut,
  );

  late Animation<double> _redProgress = Tween(
    begin: 0.002,
    end: _randomValue(),
  ).animate(_curve);

  late Animation<double> _greenProgress = Tween(
    begin: 0.002,
    end: _randomValue(),
  ).animate(_curve);

  late Animation<double> _blueProgress = Tween(
    begin: 0.002,
    end: _randomValue(),
  ).animate(_curve);

  void _animateValues() {
    setState(() {
      _redProgress = Tween(
        begin: _redProgress.value,
        end: _randomValue(),
      ).animate(_curve);

      _greenProgress = Tween(
        begin: _greenProgress.value,
        end: _randomValue(),
      ).animate(_curve);

      _blueProgress = Tween(
        begin: _blueProgress.value,
        end: _randomValue(),
      ).animate(_curve);
    });

    _animationController.forward(from: 0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
                redProgress: _redProgress.value,
                greenProgress: _greenProgress.value,
                blueProgress: _blueProgress.value,
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
  final double redProgress;
  final double greenProgress;
  final double blueProgress;

  AppleWatchPainter({
    required this.redProgress,
    required this.greenProgress,
    required this.blueProgress,
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
      redProgress * pi,
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
      greenProgress * pi,
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
      blueProgress * pi,
      false,
      blueArcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant AppleWatchPainter oldDelegate) {
    return oldDelegate.redProgress != redProgress ||
        oldDelegate.greenProgress != greenProgress ||
        oldDelegate.blueProgress != blueProgress;
  }
}
