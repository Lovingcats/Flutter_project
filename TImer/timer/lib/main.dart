import 'package:flutter/material.dart';
import 'dart:async';
import 'package:timer/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TimerPage(title: 'Timer Page'),
    );
  }
}

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int _timerCount = 0;
  int _timerCount1 = 0;
  int _timerCount2 = 0;
  bool _iconpress = false;
  late Timer _timer;
  int _currentIndex = 0;

  void dispose() {
    _timer.cancel();

    super.dispose();
  }

  void chooseIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Timer", style: TextStyle(fontSize: 30)),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: chooseIndex,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Timer',
              icon: Icon(Icons.timer),
            ),
            BottomNavigationBarItem(
                label: 'notice',
                icon: Icon(Icons.notifications_none),
                backgroundColor: Colors.orange),
            BottomNavigationBarItem(
                label: 'countdown',
                icon: Icon(Icons.hourglass_bottom),
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
                label: 'WorldTime',
                icon: Icon(Icons.public),
                backgroundColor: Colors.green),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 70,
                  ),
                  Text(
                    "$_timerCount",
                    style: const TextStyle(fontSize: 50),
                  ),
                  Text(
                    "h : $_timerCount1",
                    style: const TextStyle(fontSize: 50),
                  ),
                  Text(
                    "m : $_timerCount2",
                    style: const TextStyle(fontSize: 50),
                  ),
                  const Text(
                    "s",
                    style: TextStyle(fontSize: 50),
                  ),
                ],
              ),
              const SizedBox(
                height: 300,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _iconpress = !_iconpress;
                  });
                  if (_iconpress) {
                    _timer = Timer.periodic(const Duration(milliseconds: 1000),
                        (timer) {
                      setState(() {
                        _timerCount2++;
                        if (_timerCount2 == 60) {
                          _timerCount2 = 0;
                          _timerCount1++;
                          if (_timerCount1 == 60) {
                            _timerCount1 = 0;
                            _timerCount++;
                          }
                        }
                      });
                    });
                  } else {
                    _timer.cancel();
                  }
                },
                icon: Icon(_iconpress ? Icons.stop : Icons.play_arrow),
                iconSize: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _timerCount = 0;
                    _timerCount1 = 0;
                    _timerCount2 = 0;
                    _iconpress = false;
                    _timer.cancel();
                  });
                },
                style: ElevatedButton.styleFrom(primary: Colors.amber),
                child: const Text("초기화", style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ));
  }
}

