import 'package:flutter/material.dart';

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
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Implicit Animations"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              // tween: 시작값과 목표값이 있는 object
              tween: ColorTween(
                begin: Colors.blue,
                end: Colors.green,
              ),
              curve: Curves.bounceInOut,
              duration: const Duration(
                seconds: 2,
              ),
              builder: (context, value, child) {
                return Image.network(
                  "https://public.rive.app/community/video-thumbnails/4304-8873-flutter-dash-watermark.png",
                  color: value,
                  colorBlendMode: BlendMode.colorBurn,
                );
              },
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
