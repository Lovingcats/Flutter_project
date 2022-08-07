import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:welcome/screens/bottombar/chat.dart';
import 'package:welcome/screens/bottombar/community.dart';
import 'package:welcome/screens/bottombar/home.dart';
import 'package:welcome/screens/bottombar/meta.dart';
import 'package:welcome/screens/bottombar/user.dart';
import 'package:welcome/widget/bottombar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return ScreenUtilInit(
      designSize: const Size(414, 736),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        title: 'Welcome',
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 5,
            child: Scaffold(
                body: const TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [Home(), Community(), Meta(), Chat(), User()],
                ),
                bottomNavigationBar: Bottom.bottomBar())),
      ),
    );
  }
}
