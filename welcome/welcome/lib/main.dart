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
  runApp(MyApp()); //앱 초기 실행 MyApp()으로 시작
}

class MyApp extends StatelessWidget { //상태변화가 없기에 StatelessWidget사용
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return ScreenUtilInit( //screenutil 라이브러리 (뒤에 .h, .w, .r, .sp등등 크기를 반응형으로 만들어줌)
      designSize: const Size(414, 736), // 어떤 사이즈를 기준으로 만들것인가
      builder: (BuildContext context, Widget? child) => MaterialApp(
        title: 'Welcome',
        debugShowCheckedModeBanner: false,
        home: DefaultTabController( //바텀바 코드
            length: 5,
            child: Scaffold(
                body: const TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [Home(), Community(), Meta(), Chat(), User()], //각각 home, community, meta, chat, user로 이동할수 있게 함
                ),
                bottomNavigationBar: Bottom.bottomBar())), // widget/bottombar.dart 코드
      ),
    );
  }
}
