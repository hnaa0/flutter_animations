import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SwipingCardsScreen extends StatefulWidget {
  const SwipingCardsScreen({super.key});

  @override
  State<SwipingCardsScreen> createState() => _SwipingCardsScreenState();
}

class _SwipingCardsScreenState extends State<SwipingCardsScreen>
    with SingleTickerProviderStateMixin {
  late final size = MediaQuery.of(context).size;

  late final AnimationController _position = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
    lowerBound: (size.width + 100) * -1,
    upperBound: (size.width + 100),
    value: 0.0,
  );

  late final Tween<double> _rotation = Tween(
    begin: -15,
    end: 15,
  );

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    //delta: 이전 업데이트 이후 포인터가 이동한 양
    _position.value += details.delta.dx;
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    final bound = size.width - 200;

    if (_position.value.abs() >= bound) {
      if (_position.value.isNegative) {
        _position.animateTo((size.width + 100) * -1);
      } else {
        _position.animateTo(size.width + 100);
      }
    } else {
      _position.animateTo(0, curve: Curves.easeOut);
    }
  }

  @override
  void dispose() {
    _position.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Swiping cards"),
      ),
      body: AnimatedBuilder(
        animation: _position,
        builder: (context, child) {
          // _position 값을 사용해서 _rotation tween 변환
          final angle = _rotation
              .transform((_position.value + size.width / 2) / size.width);

          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: 100,
                child: GestureDetector(
                  onHorizontalDragUpdate: _onHorizontalDragUpdate,
                  onHorizontalDragEnd: _onHorizontalDragEnd,
                  child: Transform.translate(
                    offset: Offset(_position.value, 0),
                    child: Transform.rotate(
                      angle: angle * pi / 180,
                      child: Material(
                        elevation: 10,
                        color: Colors.red.shade100,
                        child: SizedBox(
                          width: size.width * 0.8,
                          height: size.height * 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
