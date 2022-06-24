import 'package:flutter/material.dart';
import 'package:timer/screens/home.dart';
import 'package:timer/screens/countdown.dart';
import 'package:timer/screens/worldtime.dart';
import 'package:timer/screens/notice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TimerPage(title: 'Timer Page'),
    );
  }
}

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int _currentIndex = 0;
  final List<Widget> _children = const [
    HomePage(),
    NoticePage(),
    CountdownPage(),
    WorldTimePage()
  ];

  void chooseIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: chooseIndex,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'Timer',
            icon: Icon(Icons.timer),
          ),
          BottomNavigationBarItem(
              label: 'notice',
              icon: Icon(Icons.notifications_none),
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              label: 'countdown',
              icon: Icon(Icons.hourglass_bottom),
              backgroundColor: Colors.yellow),
          BottomNavigationBarItem(
              label: 'WorldTime',
              icon: Icon(Icons.public),
              backgroundColor: Colors.green),
        ],
      ),
    );
  }
}
