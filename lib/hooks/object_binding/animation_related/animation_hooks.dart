// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimationHooks extends HookWidget {
  late AnimationController controller;
  late Color? colorAnimation;
  late double sizeAnimation;

  AnimationHooks({Key? key}) : super(key: key);

  void useMyAnimation() {
    // Defining a 2-seconds duration controller animation
    controller = useAnimationController(duration: const Duration(seconds: 2));

    // Defining both color and size animations
    colorAnimation = useAnimation(
      ColorTween(begin: Colors.blue, end: Colors.yellow).animate(controller),
    );
    sizeAnimation = useAnimation(
      Tween<double>(begin: 75.5, end: 150.0).animate(controller),
    );

    // Repeat the animation after finish
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    useMyAnimation();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Hooks Demo"),
      ),
      body: Center(
        child: CircleAvatar(
          radius: sizeAnimation,
          backgroundColor: colorAnimation,
        ),
      ),
    );
  }
}
