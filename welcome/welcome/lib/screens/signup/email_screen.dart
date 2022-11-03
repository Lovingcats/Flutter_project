import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:welcome/common/common.dart';
import 'package:welcome/provider/signupproivder.dart';
import 'package:welcome/screens/signup/emailConfirm_screen.dart';
import 'package:http/http.dart' as http;

class Email extends StatefulWidget {
  const Email({Key? key}) : super(key: key);

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  final _emailController =
      TextEditingController(); //textfield를 이용하기 위한 controller
  String email = '';
  bool error = false;
  late bool isValid;

  void postrequest(String email) async {
    print("실행됨");
    String url = 'http://13.125.225.199:8003/login/mail';
    http.Response response =
        await http.post(Uri.parse(url), body: <String, String>{
      "email": email,
    });
    print(response.body);
    print('실행되었습ㄴ디ㅏ');
    print(response.statusCode);
    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const EmailConfirm()));
    }
  }

  @override
  Widget build(BuildContext context) {
    var signupData = Provider.of<SignupData>(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); //화면 밖을 클릭하면 키보드가 내려가게
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomSheet: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom), //위 상태바 없애기
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    email = _emailController.text;
                    if (email == "") {
                      error = true;
                    } else {
                      error = false;
                    }
                    if (error) {
                      print("에러발생");
                    } else {
                      signupData.inputId(email);
                      postrequest(email);
                    }
                  });
                },
                child: Text("인증받기", style: TextStyle(fontSize: 24.sp)),
                style: ElevatedButton.styleFrom(
                    primary: CommonColor.blue, minimumSize: Size(414.w, 59.h)),
              )),
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 12.h, left: 11.w),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 22.h,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 25.h, left: 20.w, bottom: 27.h, right: 131.w),
                child: Text(
                  "사용할 이메일을 입력해주세요",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 28.w, right: 28.w),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    enabledBorder: error
                        ? const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1),
                          )
                        : const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                    focusedBorder: error
                        ? const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1),
                          )
                        : UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: CommonColor.blue, width: 1),
                          ),
                    focusedErrorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 5),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 490.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
