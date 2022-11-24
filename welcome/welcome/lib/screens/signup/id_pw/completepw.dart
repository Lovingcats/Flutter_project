import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:welcome/common/common.dart';
import 'package:http/http.dart' as http;
import 'package:welcome/main.dart';

class CompletePw extends StatefulWidget {
  final String email;
  const CompletePw({Key? key, required this.email}) : super(key: key);

  @override
  State<CompletePw> createState() => _CompletePwState();
}

class _CompletePwState extends State<CompletePw> {
  final _pwController = TextEditingController();
  String pw = '';

  final _pwController1 = TextEditingController();
  String pw1 = '';

  bool pwEmpty = false;
  bool pwEmpty1 = false;

  bool ischeck = false;
  bool ischeck1 = false;

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

  void confirmsuccess() {
    Fluttertoast.showToast(
        msg: "변경되었습니다",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.sp);
  }

  void confirmsuccess1() {
    Fluttertoast.showToast(
        msg: "다시시도해주세요",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.sp);
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(5),
          child: Container(
            height: 140.h,
            width: 60.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }

  void postrequest(String pw1) async {
    print("실행됨");
    String url = 'http://13.125.225.199:8003/login/update_pwd';
    _onLoading();
    http.Response response = await http.post(Uri.parse(url),
        body: <String, String>{"email": widget.email, "pwd": pw1});
    var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
    
    if (parsingData['success']) {
      Navigator.pop(context);
      confirmsuccess();
      Navigator.push(context, MaterialPageRoute(builder: (_) => const Login()));
    } else {
      Navigator.pop(context);
      confirmsuccess1();
    }
    print("1111111111");
    print(parsingData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "비밀번호 재설정",
          style: TextStyle(
              fontSize: 23.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 22.h,
            )),
      ),
      bottomSheet: SafeArea(
        child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: ElevatedButton(
              onPressed: () {
                if (_pwController.text == "" || _pwController1.text == "") {
                  setState(() {
                    ischeck = true;
                  });
                } else if (_pwController.text == _pwController1.text) {
                  postrequest(_pwController.text);
                } else {
                  setState(() {
                    ischeck1 = true;
                  });
                }
              },
              child: Text("다음", style: TextStyle(fontSize: 24.sp)),
              style: ElevatedButton.styleFrom(
                  backgroundColor: CommonColor.blue,
                  minimumSize: Size(414.w, 59.h)),
            )),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30.w, top: 15.h),
                  child: SizedBox(
                    width: 350.w,
                    child: TextField(
                      controller: _pwController,
                      decoration: InputDecoration(
                        labelText: '새 비밀번호 입력',
                        enabledBorder: pwEmpty
                            ? const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1),
                              )
                            : const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                        focusedBorder: pwEmpty
                            ? const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1),
                              )
                            : UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: CommonColor.blue, width: 1),
                              ),
                        focusedErrorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 5),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30.w, top: 6.h, bottom: 10.h),
                  child: SizedBox(
                    width: 350.w,
                    child: TextField(
                      controller: _pwController1,
                      decoration: InputDecoration(
                        labelText: '비밀번호 확인',
                        enabledBorder: pwEmpty1
                            ? const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1),
                              )
                            : const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                        focusedBorder: pwEmpty1
                            ? const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1),
                              )
                            : UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: CommonColor.blue, width: 1),
                              ),
                        focusedErrorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 5),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ischeck
                ? Text(
                    "비밀번호를 입력해주세요",
                    style: TextStyle(fontSize: 15.sp, color: Colors.red),
                  )
                : ischeck1
                    ? Text("비밀번호가 일치하지 않습니다. 다시 시도해주세요",
                        style: TextStyle(fontSize: 15.sp, color: Colors.red))
                    : Text(
                        "data",
                        style: TextStyle(fontSize: 0.1.sp, color: Colors.white),
                      )
          ],
        ),
      ),
    );
  }
}
