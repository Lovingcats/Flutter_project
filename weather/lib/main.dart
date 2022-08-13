import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/screens/loading.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return ScreenUtilInit(
      designSize: const Size(400, 700),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        title: '날씨앱',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 60.w),
              child: Text(
                '83°',
                style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 60.w),
              child: Text(
                'sunny',
                style: TextStyle(fontSize: 27.sp, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.light_mode,
                    color: Colors.yellow,
                    size: 180.h,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
                Container(
                  width: double.infinity,
                  height: 242.h,
                  color: Colors.black,
                  child: Column(
                    
                  ),
                )
              ],
            
        ),
      ),
    );
  }
}
