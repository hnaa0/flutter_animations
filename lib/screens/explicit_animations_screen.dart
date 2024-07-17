import 'package:flutter/material.dart';

class ExplicitAnimationsScreen extends StatefulWidget {
  const ExplicitAnimationsScreen({super.key});

  @override
  State<ExplicitAnimationsScreen> createState() =>
      _ExplicitAnimationsScreenState();
}

//SingleTickerProviderStateMixin: 트리가 활성화되어 있는 동안만 Ticker를 제공
class _ExplicitAnimationsScreenState extends State<ExplicitAnimationsScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  );

  late final Animation<Decoration> _decoration = DecorationTween(
    begin: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(20),
    ),
    end: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(120),
    ),
  ).animate(_animationController);

  late final Animation<double> _rotation = Tween(
    begin: 0.0,
    end: 2.0,
  ).animate(_animationController);

  late final Animation<double> _scale = Tween(
    begin: 1.0,
    end: 1.1,
  ).animate(_animationController);

  late final Animation<Offset> _position = Tween(
    begin: const Offset(0, 0),
    end: const Offset(0, -0.5),
  ).animate(_animationController);

  void _play() {
    _animationController.forward();
  }

  void _pause() {
    _animationController.stop();
  }

  void _rewind() {
    _animationController.reverse();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Explicit Animations",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _position,
              child: ScaleTransition(
                scale: _scale,
                child: RotationTransition(
                  turns: _rotation,
                  child: DecoratedBoxTransition(
                    decoration: _decoration,
                    child: const SizedBox(
                      width: 350,
                      height: 350,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _play,
                  child: const Text("play"),
                ),
                ElevatedButton(
                  onPressed: _pause,
                  child: const Text("pause"),
                ),
                ElevatedButton(
                  onPressed: _rewind,
                  child: const Text("rewind"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
