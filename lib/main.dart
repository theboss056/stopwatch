import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:Stopwatch/splashscreen.dart';

//creating provider
final swProvider = ChangeNotifierProvider<Sw>((ref) {
  return Sw();
});

class Sw extends ChangeNotifier {
  Stopwatch stopwatch = Stopwatch();
  Timer? timer;

  bool isRunning = false;
  List<String> laps = [];

  void handleStartStop() {
    if (stopwatch.isRunning) {
      // stopwatch.stop();
      stopwatch.stop();
      timer?.cancel();
      isRunning = false;
      notifyListeners();
    } else {
      //stopwatch.start();
      stopwatch.start();
      timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
        notifyListeners();
      });
      isRunning = true;
      notifyListeners();
    }
  }

  void start() {
    stopwatch.start();
    timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      notifyListeners();
    });
    isRunning = true;
    notifyListeners();
  }

  void stop() {
    stopwatch.stop();
    timer?.cancel();
    isRunning = false;
    notifyListeners();
  }

  void reset() {
    stopwatch.reset();
    isRunning = false;
    timer?.cancel();
    notifyListeners();
  }

  String get elapsedTimeString {
    // Format the elapsed time in MM:SS:MM format
    final elapsedMilliseconds = stopwatch.elapsedMilliseconds;
    final seconds = elapsedMilliseconds ~/ 1000;
    final minutes = seconds ~/ 60;
    final hours = minutes ~/ 60;

    final formattedTime =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${(seconds % 60).toString().padLeft(2, '0')}:${(elapsedMilliseconds % 1000).toString().padLeft(3, '0')}';

    return formattedTime;
  }

  void addLap() {
    laps.add(elapsedTimeString);
    notifyListeners();
  }
}

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
