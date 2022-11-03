import 'dart:async';
import 'dart:math';

StreamController<int> timedCounterController(Duration interval,
    [int? maxCount]) {
  late StreamController<int> controller;
  Timer? timer;
  int counter = 0;

  void tick(_) {
    counter++;
    controller.add(counter); // Ask stream to send counter values as event.
    if (counter == maxCount) {
      timer?.cancel();
      controller.close(); // Ask stream to shut down and tell listeners.
    }
  }

  void startTimer() {
    timer = Timer.periodic(interval, tick);
  }

  void stopTimer() {
    timer?.cancel();
    timer = null;
  }

  controller = StreamController<int>(
      onListen: startTimer,
      onPause: stopTimer,
      onResume: startTimer,
      onCancel: stopTimer);

  return controller;
}

Stream<int> randomNumbersStream() async* {
  await Future.delayed(const Duration(seconds: 2));

  while (true) {
    await Future.delayed(const Duration(milliseconds: 500));
    yield Random().nextInt(5000);
  }
}
