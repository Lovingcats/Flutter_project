import 'package:flutter/material.dart';
import 'package:license/screen/home_screen.dart';
import 'package:license/screen/profile_screen.dart';
import 'package:license/screen/search_screen.dart';
import 'package:license/screen/profile_screen.dart';
import 'package:license/widget/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TabController controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'licence',
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFD8EAFF)),
        home: const DefaultTabController(
          length: 3,
          child: Scaffold(
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                Home(),
                Profile(),
                Search(),
              ],
            ),
            bottomNavigationBar: Bottom(),
          ),
        ));
  }
}
