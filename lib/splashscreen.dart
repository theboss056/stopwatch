import 'package:flutter/material.dart';

import 'homescreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => StopwatchPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Column(
          children: [
            Expanded(
                child: Center(
              child: Text(
                " Stopwatch",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),
              ),
            )),
            Expanded(
                child: Icon(
              Icons.timer,
              size: 100.0,
            )),
            Expanded(child: Text("Made in Bharat with ❤️")),
          ],
        ));
  }
}
