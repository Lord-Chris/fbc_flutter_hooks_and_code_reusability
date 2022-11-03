


  import 'dart:async';

import 'package:fbc_hooks_project/hooks/object_binding/dart_async/stream_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class StreamNoHooks extends StatefulWidget {
  const StreamNoHooks({Key? key}) : super(key: key);

  @override
  State<StreamNoHooks> createState() => _StreamNoHooksState();
}

class _StreamNoHooksState extends State<StreamNoHooks> {
  late StreamController<int> controller;
  @override
  void initState() {
    super.initState();
    controller = timedCounterController(const Duration(seconds: 1));
  }

  @override
  void dispose() {
    super.dispose();
    controller.close();
  }

  @override
  Widget build(BuildContext context) {
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
