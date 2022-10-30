import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimationHooks extends HookWidget {
  late AnimationController controller;
  late Color? colorAnimation;
  late double sizeAnimation;

  AnimationHooks({Key? key}) : super(key: key);

  void useMyAnimation() {
    // Defining controller with animation duration of two seconds
    controller = useAnimationController(duration: const Duration(seconds: 2));
    // Rebuilding the screen when animation goes ahead
    colorAnimation = useAnimation(
      ColorTween(begin: Colors.blue, end: Colors.yellow).animate(controller),
    );
    // Defining both color and size animations
    sizeAnimation = useAnimation(
      Tween<double>(begin: 100.0, end: 200.0).animate(controller),
    );

    // controller.addListener(() {
    //   setState(() {});
    // });

    // Repeat the animation after finish
    controller.repeat();

    //For single time
    //controller.forward()

    //Reverses the animation instead of starting it again and repeats
    // controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    useMyAnimation();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Hooks Demo"),
      ),
      body: Center(
        child: Container(
          height: sizeAnimation,
          width: sizeAnimation,
          color: colorAnimation,
        ),
      ),
    );
  }
}
