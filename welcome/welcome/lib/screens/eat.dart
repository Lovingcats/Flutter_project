import 'package:flutter/material.dart';

class Eat extends StatelessWidget {
  const Eat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        children: const[
          Center(
            child: Text("eat"),
          )
        ],
      ),
    );
  }
}