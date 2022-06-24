import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:welcome/screens/instargram_story.dart';

const step = 5;
const ballSize = 20.0;
double position = 0;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome',
      home: AJoyStick(),
    );
  }
}

class AJoyStick extends StatefulWidget {
  const AJoyStick({Key? key}) : super(key: key);

  @override
  State<AJoyStick> createState() => _AJoyStickState();
}

class _AJoyStickState extends State<AJoyStick> {
  double _x = 1900;
  double _y = 1100;

  final JoystickMode _joystickMode = JoystickMode.all;

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
              child: Image.asset("images/map3.png"),
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
