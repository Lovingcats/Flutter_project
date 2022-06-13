import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:welcome/screens/instargram_story.dart';
import 'dart:async';

const step = 3; //한번 이동할때 얼마나 이동할것인가?
const ballSize = 20.0; //이동할 주체의 크기
double position = 0;

//title과 debug표시를 없애고 Joystick 불러옴
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

//상태변화가 있는 위젯이라 stateful 위젯으로 선언
class JoyStick extends StatefulWidget {
  const JoyStick({Key? key}) : super(key: key);

  @override
  State<JoyStick> createState() => _JoyStickState();
}

class _JoyStickState extends State<JoyStick> {
  //움직이는 주체의 처음 위치
  double _x = 100;
  double _y = 100;
  final JoystickMode _joystickMode = JoystickMode.all;

  //GlobalKey 선언(위젯의 크기를 구하기 위함)
  GlobalKey _viewkey = GlobalKey();

  @override
  void initState() {
    super.initState();

    //위젯이 그려진 후 _getSize가 실행 됨
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _getSize();
    });
  }

  _getSize() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _bx = MediaQuery.of(context).size.width / 2;
    double _by = MediaQuery.of(context).size.height / 2;
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedPositioned(
              left: _x * -1,
              top: _y * -1,
              child: Image.asset("images/mapExample.png"),
              duration: Duration(milliseconds: 200),
            ),
            Positioned(
              left: 100,
              top: 200,
              child: Container(width: 20, height: 20, color: Colors.black),
            ),
            Ball(_bx, _by),
            Align(
              alignment: const Alignment(0, 0.8),
              child: Joystick(
                mode: _joystickMode,
                listener: (details) {
                  setState(() {
                    if (((_x >= 95) && (_x <= 105)) &&
                        ((_y >= 195) && (_y <= 205))) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => StoryPageView()));
                      _x = 120;
                      _y = 200;
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
