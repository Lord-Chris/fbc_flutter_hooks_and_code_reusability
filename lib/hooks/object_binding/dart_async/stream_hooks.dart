import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class StreamHooks extends HookWidget {
  const StreamHooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useStreamController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream No Hooks"),
      ),
      body: StreamBuilder(
        stream: controller.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Text(snapshot.data.toString()),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
