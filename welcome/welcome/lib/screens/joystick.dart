import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:welcome/screens/instargram_story.dart';

const step = 5; //한번 이동할때 얼마나 이동할것인가?
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
  //캐릭터가 아닌 맵을 움직임
  double _x = 1900;
  double _y = 1100;

  final JoystickMode _joystickMode = JoystickMode.all;

  //GlobalKey 선언(위젯의 크기를 구하기 위함)
  GlobalKey _mapkey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //공의 처음 위치
    double _bx = MediaQuery.of(context).size.width / 2;
    double _by = MediaQuery.of(context).size.height / 2;
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedPositioned(
              //맵의 처음 위치(반응형)
              left: _x * -1,
              top: _y * -1,
              child: Image.asset("images/map.png"),
              duration: Duration(milliseconds: 200),
            ),
            Positioned(
              left: (_x - 1800) * -1,
              top: (_y - 900) * -1,
              child: Container(width: 20, height: 20, color: Colors.black),
            ),
            Ball(_bx, _by),
            Align(
              alignment: const Alignment(0, 0.8),
              child: Joystick(
                mode: _joystickMode,
                listener: (details) {
                  setState(() {
                    if (((_x >= (_x - 1795) * -1) &&
                            (_x <= (_x - 1805) * -1)) &&
                        ((_y >= (_y - 895) * -1) && (_y <= (_y - 905) * -1))) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => StoryPageView()));
                      _x = (_x - 1830) * -1;
                      _y = (_y - 920) * -1;
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
