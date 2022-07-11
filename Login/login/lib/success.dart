import 'package:flutter/material.dart';

void main() {
  runApp(const SuccessApp());
}

class SuccessApp extends StatelessWidget {
  const SuccessApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'LoginSuccess',
      debugShowCheckedModeBanner: false,
      home: Success(),
    );
  }
}

class Success extends StatelessWidget {
  const Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Success"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: const [
            Text("로그인에 성공하셨습니다!")
          ],
        ),
      )
    );
  }
}
