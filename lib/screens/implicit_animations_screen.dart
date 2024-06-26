import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImplicitAnimationsScreen extends StatefulWidget {
  const ImplicitAnimationsScreen({super.key});

  @override
  State<ImplicitAnimationsScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ImplicitAnimationsScreen> {
  bool _visible = true;

  void _trigger() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Implicit Animations"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              transformAlignment: Alignment.center,
              transform: Matrix4.rotationZ(_visible ? 1 : 0),
              decoration: BoxDecoration(
                color: _visible ? Colors.purple : Colors.pink,
                borderRadius: BorderRadius.circular(_visible ? 100 : 0),
              ),
              width: size.width * 0.8,
              height: size.width * 0.8,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(onPressed: _trigger, child: const Text("go")),
          ],
        ),
      ),
    );
  }
}
