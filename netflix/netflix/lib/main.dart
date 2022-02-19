import 'package:flutter/material.dart';
import 'package:netflix/screen/home_screen.dart';
import 'package:netflix/widget/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TabController controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'netfilx',
        theme:
            ThemeData(brightness: Brightness.dark, primaryColor: Colors.black),
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
              body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const HomeScreen(),
                  Container(),
                  Container(),
                  Container(),
                ],
              ),
              bottomNavigationBar: const Bottom(),
            )));
  }
}
