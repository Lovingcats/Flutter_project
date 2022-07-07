import 'package:flutter/material.dart';

class WorldTime extends StatefulWidget {
  const WorldTime({Key? key}) : super(key: key);

  @override
  _WorldTimeState createState() => _WorldTimeState();
}

class _WorldTimeState extends State<WorldTime> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WorldTime',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WorldTimePage(),
    );
  }
}

class WorldTimePage extends StatefulWidget {
  const WorldTimePage({Key? key}) : super(key: key);

  @override
  _WorldTimePageState createState() => _WorldTimePageState();
}

class _WorldTimePageState extends State<WorldTimePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WorldTime", style: TextStyle(fontSize: 19)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: const [
            SizedBox(height: 30),
            Text("WorldTime",
                style: TextStyle(fontSize: 30, color: Colors.black))
          ],
        ),
      ),
    );
  }
}
