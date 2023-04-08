import 'dart:async';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isPlaying = false;
  int index = 1;
  Timer? timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Image.asset("assets/images/$index.png")),
            ),
            ElevatedButton(
              onPressed: () {
                if (isPlaying) {
                  pause();
                  timer!.cancel();
                } else {
                  play();
                }
              },
              child: const Text('Play'),
            ),
          ],
        ),
      ),
    );
  }

  void pause() {
    isPlaying = false;
    setState(() {});
  }

  void play() {
    setState(() {
      isPlaying = true;
    });
    setState(() {
      timer = Timer.periodic(const Duration(milliseconds: 60), (t) {
        index = index + 1;
        if (index == 0) index = 1;
        if (index < 0) index = 8;
        if (index > 8) index = 1;
        setState(() {});
      });
    });
  }
}
