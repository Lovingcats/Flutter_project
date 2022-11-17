import 'package:flutter/material.dart';
import 'package:welcome/screens/bottombar/community.dart';
import 'package:welcome/screens/bottombar/home.dart';
import 'package:welcome/screens/bottombar/meta.dart';
import 'package:welcome/screens/bottombar/user.dart';
import 'package:welcome/widget/bottombar.dart';
// import 'package:http/http.dart' as http;

class Bottombar extends StatefulWidget {
  const Bottombar({Key? key}) : super(key: key);

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        //바텀바 코드
        length: 4,
        child: Scaffold(
            body: const TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                Home(),
                Meta(),
                Community(),
                User()
              ], //각각 home, community, meta, chat, user로 이동할수 있게 함
            ),
            bottomNavigationBar: Bottom.bottomBar()));
  }
}
