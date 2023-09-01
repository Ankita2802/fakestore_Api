import 'dart:async';
import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  StreamController _controller = StreamController();
  int _counter = 10;
  late Stream mystream;
  @override
  void initState() {
    mystream = _controller.stream.asBroadcastStream();
    super.initState();
  }

  void StartTimer() async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      _counter--;
      _controller.sink.add(_counter);
      if (_counter <= 0) {
        timer.cancel();
        _controller.close();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              initialData: _counter,
              stream: mystream,
              builder: (context, snapshot) {
                return Text("${snapshot.data}");
              },
            ),
            StreamBuilder(
              initialData: _counter,
              stream: mystream,
              builder: (context, snapshot) {
                return Text("${snapshot.data}");
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  StartTimer();
                },
                child: Text("start count down"))
          ],
        ),
      ),
    );
  }
}
