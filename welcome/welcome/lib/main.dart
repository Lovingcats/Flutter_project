import 'package:flutter/material.dart';
import 'package:welcome/common/common.dart';
import 'package:welcome/screens/picture.dart';
import 'package:welcome/screens/signup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:welcome/screens/signup/id_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return ScreenUtilInit(
      designSize: const Size(414, 736),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Welcome',
        home: const Welcome(),
        theme: ThemeData(),
      ),
    );
  }
}

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final _idController = TextEditingController();
  final _pwdController = TextEditingController();

  String id = '';
  String pwd = '';

  final String _url = "http://10.150.149.119:8888/login/signin";

  void LoginSucces() {
    Fluttertoast.showToast(
        msg: "로그인에 성공하셨습니다",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CommonColor.blue,
        appBar: null,
        body: Builder(builder: (context) {
          return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70.h,
                      ),
                      Icon(
                        Icons.circle,
                        size: 150.h,
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        "WElBATO",
                        style: TextStyle(
                          fontSize: 50.sp,
                          fontFamily: "Grandstander",
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 28.h),
                      Container(
                        width: 321.w,
                        height: 182.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.r))),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(48.w, 10.h, 48.w, 10.h),
                              child: TextField(
                                controller: _idController,
                                decoration: InputDecoration(
                                  labelText: 'ID',
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: CommonColor.blue, width: 1),
                                  ),
                                  focusedErrorBorder:
                                      const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red, width: 5),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(48.w, 0.h, 48.w, 10.h),
                              child: TextField(
                                controller: _pwdController,
                                decoration: InputDecoration(
                                  labelText: 'PW',
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: CommonColor.blue, width: 1),
                                  ),
                                  focusedErrorBorder:
                                      const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red, width: 5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 13),
                        child: ElevatedButton(
                            onPressed: () async {
                              // setState(() {
                              //   id = _idController.text;
                              //   pwd = _pwdController.text;
                              // });
                              // http.Response response = await http.post(
                              //   Uri.parse(_url),
                              //   headers: <String, String>{
                              //     'Content-Type':
                              //         'application/x-www-form-urlencoded',
                              //   },
                              //   body: <String, String>{
                              //     'id': "$id",
                              //     'pwd': "$pwd",
                              //   },
                              // );
                              LoginSucces();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const Picture()));
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              primary: Colors.white,
                              minimumSize: Size(194.w, 40.h),
                            ),
                            child: Text(
                              "로그인",
                              style: TextStyle(
                                  fontSize: 14.sp, color: CommonColor.blue),
                            )),
                      ),
                      SizedBox(
                        height: 27.h,
                      ),
                      Column(
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const ID()));
                              },
                              child: const Text(
                                "회원가입",
                                style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 3),
                              )),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "비밀번호를 잊어버리셨나요?",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ));
        }));
    // ignore: non_constant_identifier_names
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
