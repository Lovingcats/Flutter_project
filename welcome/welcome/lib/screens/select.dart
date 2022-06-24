import 'package:flutter/material.dart';
import 'package:welcome/maps/a.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Select',
      home: Select(),
    );
  }
}

class Select extends StatefulWidget {
  const Select({Key? key}) : super(key: key);

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Container(
            width: double.infinity, //가로 꽉 차게
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/map3.png'), opacity: 0.5
                  // 배경 이미지
                  ),
            ),
          ),
          Positioned(
            top: 320,
            left: 10,
            child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const AJoyStick()));
                },
                child: const Text(
                  "A구역",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
          ),
          Positioned(
            top: 230,
            left: 150,
            child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const AJoyStick()));
                },
                child: const Text(
                  "B구역",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
          ),
          Positioned(
            top: 320,
            left: 295,
            child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const AJoyStick()));
                },
                child: const Text(
                  "C구역",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
          ),
        ],
      ),
    );
  }
}
