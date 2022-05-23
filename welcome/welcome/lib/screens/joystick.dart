import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:welcome/screens/instargram_story.dart';
import 'dart:async';

const step = 10;
const ballSize = 20.0;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome',
      home: JoyStick(),
    );
  }
}

class JoyStick extends StatefulWidget {
  const JoyStick({Key? key}) : super(key: key);

  @override
  State<JoyStick> createState() => _JoyStickState();
}

class _JoyStickState extends State<JoyStick> {
  bool isfind = false;
  double _x = 200;
  double _y = 200;
  late Timer timer = timer;
  final JoystickMode _joystickMode = JoystickMode.all;
  int _timerCount = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.white,
            ),
            Positioned(
              left: 100,
              top: 200,
              child: Container(width: 20, height: 20, color: Colors.black),
            ),
            Ball(_x, _y),
            Align(
              alignment: const Alignment(0, 0.8),
              child: Joystick(
                mode: _joystickMode,
                listener: (details) {
                  setState(() {
                    if (((_x >= 95) && (_x <= 105)) &&
                        ((_y >= 195) && (_y <= 205)) &&
                        isfind == false) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => StoryPageView()));
                      isfind = true;
                      _timerCount = 0;
                      timer = Timer.periodic(const Duration(milliseconds: 1000),
                          (timer) {
                        setState(() {
                          _timerCount++;
                          if (_timerCount == 3) {
                            isfind = false;
                          }
                        });
                      });
                    }
                    _x = _x + step * details.x;
                    _y = _y + step * details.y;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Ball extends StatelessWidget {
  final double x;
  final double y;

  const Ball(this.x, this.y, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: Container(
        width: ballSize,
        height: ballSize,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.redAccent,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 3),
            )
          ],
        ),
      ),
    );
  }
}
