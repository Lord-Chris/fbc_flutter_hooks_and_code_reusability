import 'package:flutter/material.dart';

class AnimationNoHook extends StatefulWidget {
  const AnimationNoHook({Key? key}) : super(key: key);

  @override
  AnimationNoHookState createState() => AnimationNoHookState();
}

class AnimationNoHookState extends State<AnimationNoHook>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation colorAnim;
  late Animation sizeAnim;

  @override
  void initState() {
    super.initState();

    // Defining controller with animation having a duration of 2 seconds
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    // Defining both color and size animations
    colorAnim =
        ColorTween(begin: Colors.red, end: Colors.purple).animate(controller);
    sizeAnim = Tween<double>(begin: 75.5, end: 150).animate(controller);

    // Rebuild the screen when animation starts
    controller.addListener(() {
      setState(() {});
    });

    // Starts and repeats the animation
    controller.repeat();
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
        child: CircleAvatar(
          radius: sizeAnim.value,
          backgroundColor: colorAnim.value,
        ),
      ),
    );
  }
}
