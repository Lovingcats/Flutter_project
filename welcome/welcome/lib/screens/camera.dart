import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

Future<void> main() async {
  // 디바이스에서 이용가능한 카메라 목록을 받아옵니다.
  final cameras = await availableCameras();

// 이용가능한 카메라 목록에서 특정 카메라를 얻습니다.
  final firstCamera = cameras.first;
  runApp(const Camera());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'camera', debugShowCheckedModeBanner: false, home: Camera());
  }
}

class Camera extends StatefulWidget {
  // 디바이스에서 이용가능한 카메라 목록을 받아옵니다.

  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
