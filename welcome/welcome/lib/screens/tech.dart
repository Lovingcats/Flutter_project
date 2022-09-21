import 'package:flutter/material.dart';
import 'package:welcome/maps/b.dart';
import 'package:welcome/screens/camera.dart';
import 'package:welcome/widget/instargram_story.dart';

//안쓴 기능들을 정리해둔 파일

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
          title: const Text("기능"),
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
              // ElevatedButton(
              //   onPressed: () {
              //     StoryDialog();
              //   },
              //   child: const Text("Alert 기능"),
              // ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const JoystickExample()));
                },
                child: const Text("조이스틱 이동 기능"),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //         context, MaterialPageRoute(builder: (_) => MyHomePage()));
              //   },
              //   child: const Text("카메라 기능"),
              // ),
            ],
          ),
        ));
  }
}
