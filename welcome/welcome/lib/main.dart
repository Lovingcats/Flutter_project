import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "welcome",
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  var alignment = Alignment.bottomLeft;
  bool _trigger = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            child: Text("Positioned"),
            top: 10.0,
          ),
          AnimatedPositioned(
            child: Container(
              color: Colors.blue,
            ),
            top: _trigger ? 10.0 : 30.0,
            height: _trigger ? 50.0 : 10.0,
            width: 70.0,
            duration: Duration(seconds: 1),
            curve: Curves.easeIn,
          ),
        ],
      ),
    );
  }
}
