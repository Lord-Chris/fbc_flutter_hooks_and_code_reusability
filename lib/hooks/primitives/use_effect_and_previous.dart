import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class EffectPreviousHooks extends HookWidget {
  const EffectPreviousHooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This describes the delay between color changes [useState]
    final delay = useState(1);

    // This describes the value of the texts opacity [useState]
    final isHalfOpaque = useState(false);
    final color = Color.fromRGBO(
      Random().nextInt(255),
      Random().nextInt(255),
      Random().nextInt(255),
      1,
    );

    // Holds the value of the color on the last rebuild
    final previousColor = usePrevious(color);

    //
    useEffect(() {
      final timer = Timer.periodic(Duration(seconds: delay.value), (timer) {
        if (timer.tick.isEven) isHalfOpaque.value = !isHalfOpaque.value;
      });
      return () {
        print("Disposed");
        timer.cancel();
      };
    }, [delay.value]);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Effect and Previous"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    if (delay.value == 2) {
                      delay.value--;
                    } else {
                      delay.value++;
                    }
                  },
                  child: Container(color: color),
                ),
              ),
              Expanded(
                child: Container(color: previousColor),
              ),
            ],
          ),
          Center(
            child: Text(
              "Delay: ${delay.value}\n\nIs Half Opaque: ${isHalfOpaque.value}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(isHalfOpaque.value ? .5 : 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
