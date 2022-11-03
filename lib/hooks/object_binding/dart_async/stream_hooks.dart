import 'dart:math';

import 'package:fbc_hooks_project/hooks/object_binding/dart_async/stream_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class StreamHooks extends HookWidget {
  const StreamHooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stream = useMemoized(randomNumbersStream, []);
    final snapshot = useStream(stream);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Hooks"),
      ),
      body: () {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.connectionState == ConnectionState.active) {
          return Container(
            color: Color.fromRGBO(0, 0, Random().nextInt(255), 1),
            child: Center(
              child: Text(
                snapshot.data.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          );
        }
        return const SizedBox();
      }(),
    );
  }
}
