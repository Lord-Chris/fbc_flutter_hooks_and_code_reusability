import 'dart:math';

import 'package:fbc_hooks_project/hooks/object_binding/dart_async/stream_setup.dart';
import 'package:flutter/material.dart';

class StreamNoHooks extends StatelessWidget {
  const StreamNoHooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream No Hooks"),
      ),
      body: StreamBuilder(
        stream: randomNumbersStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.active) {
            return Container(
              color: Color.fromRGBO(0, Random().nextInt(255), 0, 1),
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
        },
      ),
    );
  }
}
