import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welcome/common/common.dart';
import 'package:welcome/screens/signup/status_screen.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class EmailConfirm extends StatefulWidget {
  const EmailConfirm({Key? key}) : super(key: key);

  @override
  State<EmailConfirm> createState() => _EmailConfirmState();
}

class _EmailConfirmState extends State<EmailConfirm> {
  final _confirmController = TextEditingController();
  //textfield를 위한 컨트롤러
  String confirm = '';
  bool error = false;
  bool isEmpty = false;

  void toastmessage() {
    Fluttertoast.showToast(
        msg: "인증코드가 올바르지않습니다. 다시 입력해주세요",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.sp);
  }

  void confirmmessage() {
    Fluttertoast.showToast(
        msg: "인증이 완료되었습니다",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.sp);
  }

  void getrequest(String confirm1) async {
    print("실행됨");
    String url = 'http://13.125.225.199:8003/login/checkCode?code=$confirm1';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
      print(parsingData);
      error = !parsingData["success"];
      if (error == false) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const Status()));
      } else {
        toastmessage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomSheet: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    confirm = _confirmController.text;
                    if (confirm == "") {
                      isEmpty = true;
                    } else {
                      isEmpty = false;
                    }
                    if (isEmpty) {
                      print("에러발생");
                    } else {
                      print(confirm);
                      getrequest(confirm);
                    }
                  });
                },
                child: Text("다음", style: TextStyle(fontSize: 24.sp)),
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
                    top: 25.h, left: 20.w, bottom: 27.h, right: 52.w),
                child: Text(
                  "메일로 도착한 인증번호를 입력해주세요",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 28.w, right: 28.w, bottom: 8.h),
                child: TextField(
                  controller: _confirmController,
                  decoration: InputDecoration(
                    labelText: '인증코드',
                    enabledBorder: isEmpty
                        ? const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1),
                          )
                        : const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                    focusedBorder: isEmpty
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
              Text(
                isEmpty ? "인증번호를 입력해주세요" : "",
                style: TextStyle(fontSize: 12.sp, color: Colors.red),
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
