import 'package:fbc_hooks_project/hooks/object_binding/animation_related/animation.dart';
import 'package:fbc_hooks_project/hooks/object_binding/animation_related/animation_hooks.dart';
import 'package:fbc_hooks_project/hooks/object_binding/dart_async/stream_no_hooks.dart';
import 'package:fbc_hooks_project/hooks/primitives/use_effect_and_previous.dart';
import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final int _counter = 0;

  // void _incrementCounter() {
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => const MyHomePage2()));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          const Text(
            "Primitive and Misc",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EffectPreviousHooks()),
              );
            },
            child: const Text("Use Effect and Previous"),
          ),
          const Text(
            "Dart: Async",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          MaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const StreamNoHooks()));
            },
            child: const Text("Stream No Hooks"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const StreamHooks()));
            },
            child: const Text("Stream Hooks"),
          ),
          const Text(
            "Animations",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          MaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const AnimationNoHook()));
            },
            child: const Text("Animation No Hooks"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => AnimationHooks()));
            },
            child: const Text("Animation Hooks"),
          ),
        ],
      ),
    );
  }
}

// class MyHomePage2 extends StatefulWidget {
//   const MyHomePage2({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage2> createState() => _MyHomePage2State();
// }

// class _MyHomePage2State extends State<MyHomePage2> {
//   late TextEditingController controller;
//   late Timer timer;

//   @override
//   void initState() {
//     super.initState();
//     timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       print("Here ${timer.tick}");
//     });
//   }

//   @override
//   void dispose() {
//     timer.cancel();
//     // controller.removeListener(() {});
//     // controller.dispose();
//     super.dispose();
//   }

//   void _incrementCounter() {}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         title: const Text("Second Page"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             TextField(
//                 // controller: controller,
//                 )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
