import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const CharApp());
}

class CharApp extends StatelessWidget {
  const CharApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '캐릭터 생성 및 닉네임생성',
      debugShowCheckedModeBanner: false,
      home: Character(),
    );
  }
}

class Character extends StatefulWidget {
  const Character({Key? key}) : super(key: key);

  @override
  State<Character> createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9EC3FF),
      appBar: null,
      body: Center(
        child: Column(
          children: const [
            Icon(
              Icons.circle,
              size: 150,
              color: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            
          ],
        ),
      ),
    );
  }
}
