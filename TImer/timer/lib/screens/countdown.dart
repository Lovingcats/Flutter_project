import 'package:flutter/material.dart';

class Countdown extends StatefulWidget {
  const Countdown({Key? key}) : super(key: key);

  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Countdown',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Countdown(),
    );
  }
}

class CountdownPage extends StatefulWidget {
  const CountdownPage({Key? key}) : super(key: key);

  @override
  _CountdownPageState createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage> {
  final hour = TextEditingController();
  final min = TextEditingController();
  final sec = TextEditingController();
  bool input = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Countdown", style: TextStyle(fontSize: 30)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              if (input == false)
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: hour,
                    decoration: const InputDecoration(
                        labelText: 'hour',
                        helperText: '시간',
                        icon: Icon(Icons.timer),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(3)),
                  ),
                ),
              if (input == false)
                SizedBox(
                  width: 65,
                  child: TextField(
                    controller: min,
                    decoration: const InputDecoration(
                        labelText: 'min',
                        helperText: '분',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(3)),
                  ),
                ),
              if (input == false)
                SizedBox(
                  width: 65,
                  child: TextField(
                    controller: sec,
                    decoration: const InputDecoration(
                        labelText: 'sec',
                        helperText: '초',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(3)),
                  ),
                ),
            ]),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "확인",
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
