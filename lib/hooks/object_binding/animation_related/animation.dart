import 'package:flutter/material.dart';

class AnimationNoHook extends StatefulWidget {
  const AnimationNoHook({Key? key}) : super(key: key);

  @override
  AnimationNoHookState createState() => AnimationNoHookState();
}

class AnimationNoHookState extends State<AnimationNoHook>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation colorAnimation;
  late Animation sizeAnimation;

  @override
  void initState() {
    super.initState();

    // Defining controller with animation duration of two seconds
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    // Defining both color and size animations
    colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.yellow).animate(controller);
    sizeAnimation = Tween<double>(begin: 100.0, end: 200.0).animate(controller);

    // Rebuilding the screen when animation goes ahead
    controller.addListener(() {
      setState(() {});
    });

    // Repeat the animation after finish
    controller.repeat();

    //For single time
    //controller.forward()

    //Reverses the animation instead of starting it again and repeats
    // controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation No Hooks Demo"),
      ),
      body: Center(
        child: Container(
          height: sizeAnimation.value,
          width: sizeAnimation.value,
          color: colorAnimation.value,
        ),
      ),
    );
  }
}
