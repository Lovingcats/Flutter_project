import 'package:flutter/material.dart';

void main() {
  runApp(const SApp());
}

class SApp extends StatelessWidget {
  const SApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '캐릭터 선택',
      debugShowCheckedModeBanner: false,
      home: SApp(),
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
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: const [
            SizedBox(
              height: 70,
            ),
            Icon(
              Icons.circle,
              size: 150,
            ),

            TextField(

            )
          ],
        ),
      ),
    );
  }
}
