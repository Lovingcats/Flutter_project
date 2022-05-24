import 'package:flutter/material.dart';
import 'package:welcome/screens/camera.dart';
import 'package:welcome/screens/instargram_story.dart';
import 'package:welcome/screens/joystick.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome',
      home: const Picture(),
      theme: ThemeData(),
    );
  }
}

class Picture extends StatefulWidget {
  const Picture({Key? key}) : super(key: key);

  @override
  State<Picture> createState() => _PictureState();
}

class _PictureState extends State<Picture> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("병준쌤을 위한 구현"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => StoryPageView()));
                },
                child: const Text("스토리 기능"),
              ),
              ElevatedButton(
                onPressed: () {
                  StoryDialog();
                },
                child: const Text("Alert 기능"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => JoyStick()));
                },
                child: const Text("조이스틱 이동 기능"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => Camera()));
                },
                child: const Text("카메라 기능"),
              ),
            ],
          ),
        ));
  }

  void StoryDialog() {
    showDialog(
        context: context,
        builder: (_) => Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(10),
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xffEDDD8A)),
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Color(0xffF29E60)),
                ),
                Positioned(
                  top: 20,
                  right: 30,
                  left: 0.01,
                  child: Container(
                    width: 530,
                    height: 620,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xffFFEE95)),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 30,
                  left: 0.01,
                  child: Container(
                    width: 500,
                    height: 80,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: Color(0xffFFAD71)),
                  ),
                ),
              ],
            )));
  }
}
