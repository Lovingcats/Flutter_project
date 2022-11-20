import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:welcome/common/common.dart';
import 'package:welcome/provider/postprovider.dart';
import 'package:welcome/provider/signupproivder.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:welcome/provider/userprovider.dart';
import 'package:welcome/screens/bottombar/bottom.dart';
import 'dart:convert';

import 'package:welcome/screens/signup/id_pw/idtodart.dart';
import 'package:welcome/screens/signup/id_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //상태변화가 없기에 StatelessWidget사용

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: PostProviderData(),
        ),
        ChangeNotifierProvider.value(value: SignupData()),
        ChangeNotifierProvider.value(value: UserData())
      ],
      child: ScreenUtilInit(
        //screenutil 라이브러리 (뒤에 .h, .w, .r, .sp등등 크기를 반응형으로 만들어줌)
        designSize: const Size(414, 736), // 어떤 사이즈를 기준으로 만들것인가
        builder: (BuildContext context, Widget? child) => const MaterialApp(
            title: 'Welcome',
            debugShowCheckedModeBanner: false,
            home: Login() // widget/bottombar.dart 코드
            ),
      ),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _MainPageState();
}

class _MainPageState extends State<Login> {
  final _idController = TextEditingController();
  final _pwdController = TextEditingController();

  String id = '';
  String pwd = '';

  void getrequest(String accessToken, var userData) async {
    String url = 'http://13.125.225.199:8003/login/get_user?token=$accessToken';

    http.Response response = await http.get(Uri.parse(url));
    var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
    print(parsingData);
    if (response.statusCode == 200) {
      if (parsingData["success"]) {
        userData.inputDatas(parsingData['userName'], parsingData['userId']);
      }
    }
  }

  void postrequest(String id1, String pw1, var userData) async {
    print("실행됨");
    String url = 'http://13.125.225.199:8003/login/signin';
    print("실행됨2");

    http.Response response = await http
        .post(Uri.parse(url), body: <String, String>{"id": id1, "pwd": pw1});
    var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
    print(parsingData);
    if (response.statusCode == 200) {
      if (parsingData["success"] == true) {
        userData.inputAccessToken("${parsingData["token"]}");
        userData.inputDatas(
            "${parsingData["userName"]}", "${parsingData["userId"]}");
        getrequest(parsingData['token'], userData);
        LoginSuccess();
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const Bottombar()));
      } else {
        LoginError();
      }
    } else {
      LoginError();
    }
  }

  void LoginSuccess() {
    //toast메세지 띄워주는 함수
    Fluttertoast.showToast(
        msg: "로그인에 성공하셨습니다",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void LoginError() {
    //toast메세지 띄워주는 함수
    Fluttertoast.showToast(
        msg: "로그인에 실패하셨습니다",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.red.withOpacity(0.4),
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    var userData = Provider.of<UserData>(context);
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
                                obscureText: true,
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
                              setState(() {
                                id = _idController.text;
                                pwd = _pwdController.text;
                              });
                              postrequest(id, pwd, userData);
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
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const IdToEmail()));
                              },
                              child: const Text(
                                "아이디/비밀번호를 잊어버리셨나요?",
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
  }
}
