import 'package:flutter/material.dart';
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
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                  child: Text('home'),
                ),
                Container(
                  child: Text('search'),
                ),
                Container(
                  child: Text('profile'),
                ),
              ],
            ),
            bottomNavigationBar: const Bottom(),
          ),
        ));
  }
}
