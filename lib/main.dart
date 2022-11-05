import 'dart:math';

import 'package:fbc_hooks_project/hooks/object_binding/animation_related/animation.dart';
import 'package:fbc_hooks_project/hooks/object_binding/animation_related/animation_hooks.dart';
import 'package:fbc_hooks_project/hooks/object_binding/dart_async/stream_no_hooks.dart';
import 'package:fbc_hooks_project/hooks/primitives/use_effect_and_previous.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'hooks/object_binding/dart_async/stream_hooks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends HookWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTabController(initialLength: 3);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Hooks Demo"),
      ),
      body: Column(
        children: [
          TabBar(
            controller: controller,
            labelColor: Colors.black,
            tabs: ["Primitive and Misc", "Dart: Async", "Animation Related"]
                .reversed
                .map((e) => Tab(text: e))
                .toList(),
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: [
                Column(
                  children: [
                    Expanded(
                      child: _buildMaterial(
                        "No Hooks Animation",
                        const AnimationNoHook(),
                      ),
                    ),
                    Expanded(
                      child: _buildMaterial(
                        "Hooks Animation",
                        AnimationHooks(),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                      child: _buildMaterial(
                        "No Hook Stream",
                        const StreamNoHooks(),
                      ),
                    ),
                    Expanded(
                      child: _buildMaterial(
                        "Hooks Stream",
                        const StreamHooks(),
                      ),
                    )
                  ],
                ),
                _buildMaterial(
                  "Use Effect and Previous",
                  const EffectPreviousHooks(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InkWell _buildMaterial(String label, Widget page) {
    final context = useContext();
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
      child: Container(
        color: Color.fromRGBO(
          Random().nextInt(255),
          Random().nextInt(255),
          Random().nextInt(255),
          1,
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
