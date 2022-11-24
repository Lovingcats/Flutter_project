import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welcome/common/common.dart';
import 'package:welcome/screens/signup/id_pw/completeid.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:welcome/screens/signup/id_pw/completepw.dart';

class IdToEmail extends StatefulWidget {
  const IdToEmail({Key? key}) : super(key: key);

  @override
  State<IdToEmail> createState() => _IdToEmailState();
}

//207
class _IdToEmailState extends State<IdToEmail> {
  bool idpressed = true;
  bool pwpressed = false;
  bool idEmpty = false;
  bool emailEmpty = false;
  bool confirmEmpty = false;
  bool emailEmpty1 = false;
  bool confirmEmpty1 = false;
  bool buttonNull = true;
  bool buttonNull1 = true;
  bool buttonNull2 = true;
  bool buttonNull3 = true;

  bool pwbuttonNull = true;
  bool pwbuttonNull1 = true;

  String email = '';
  String confirm = '';
  String email1 = '';
  String confirm1 = '';
  String id = '';
  String findid = '';
  String findemail = '';
  int page = 0;
  PageController pageController = PageController(
    initialPage: 0,
  );
  final _emailController1 = TextEditingController();
  final _confirmController1 = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  void emailtrue() {
    Fluttertoast.showToast(
        msg: "인증번호가 전송되었습니다",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
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

  void getrequest(String confirm5) async {
    bool error = false;
    print("실행됨");
    String url = 'http://13.125.225.199:8003/login/checkCode?code=$confirm5';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
      print(parsingData);
      error = !parsingData["success"];
      if (error == false) {
        confirmsuccess();
        setState(() {
          buttonNull = false;
        });
      } else {
        toastmessage();
      }
    }
  }

  void getrequest1(String confirm5) async {
    bool error = false;
    print("실행됨");
    String url = 'http://13.125.225.199:8003/login/checkCode?code=$confirm5';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
      print(parsingData);
      error = !parsingData["success"];
      if (error == false) {
        confirmsuccess();
        setState(() {
          buttonNull3 = false;
        });
      } else {
        toastmessage();
      }
    }
  }

  void emailfalse() {
    Fluttertoast.showToast(
        msg: "이메일이 잘못되었습니다",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.sp);
  }

  void confirmsuccess() {
    Fluttertoast.showToast(
        msg: "인증되었습니다",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.sp);
  }

  void postrequest1(String email3) async {
    String url = 'http://13.125.225.199:8003/login/reserch_id';
    _onLoading();
    http.Response response = await http
        .post(Uri.parse(url), body: <String, String>{"email": email3});
    var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
    if (parsingData['success']) {
      Navigator.pop(context);
      findid = parsingData['name'];
      findemail = parsingData['email'];
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  CompleteId(findid: findid, findemail: findemail)));
    } else {
      Navigator.pop(context);
    }
    print("1111111111");
    print(parsingData);
  }

  void postrequest(String email) async {
    String url = 'http://13.125.225.199:8003/login/mail';
    _onLoading();
    http.Response response =
        await http.post(Uri.parse(url), body: <String, String>{"email": email});
    var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
    if (parsingData['success']) {
      Navigator.pop(context);
      emailtrue();
      setState(() {
        buttonNull1 = false;
      });
    }
  }

  void postrequest2(String email) async {
    String url = 'http://13.125.225.199:8003/login/mail';
    _onLoading();
    http.Response response =
        await http.post(Uri.parse(url), body: <String, String>{"email": email});
    var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
    if (parsingData['success']) {
      Navigator.pop(context);
      emailtrue();
      setState(() {
        buttonNull2 = false;
      });
    }
  }

  void postequest1(String email) async {
    String url = 'http://13.125.225.199:8003/login/email_check';
    http.Response response =
        await http.post(Uri.parse(url), body: <String, String>{"email": email});
    var parsingData = jsonDecode(utf8.decode(response.bodyBytes));

    if (parsingData['success']) {
      postrequest2(email);
    } else {
      emailfalse();
    }
  }

  void postequest(String email) async {
    String url = 'http://13.125.225.199:8003/login/email_check';
    http.Response response =
        await http.post(Uri.parse(url), body: <String, String>{"email": email});
    var parsingData = jsonDecode(utf8.decode(response.bodyBytes));

    if (parsingData['success']) {
      postrequest(email);
    } else {
      emailfalse();
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
                onPressed: page == 0
                    ? buttonNull
                        ? null
                        : () {
                            postrequest1(email);
                          }
                    : buttonNull3
                        ? null
                        : () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => CompletePw(email: email1,)));
                          },
                child: Text("다음", style: TextStyle(fontSize: 24.sp)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: CommonColor.blue,
                    minimumSize: Size(414.w, 59.h)),
              )),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "아이디/비번찾기",
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
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 55.w, right: 55.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          idpressed = true;
                          pwpressed = false;
                          pageController.jumpToPage(0);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent, elevation: 0),
                      child: Text(
                        "아이디",
                        style: TextStyle(
                            fontSize: 20.sp,
                            color:
                                idpressed ? CommonColor.blue : CommonColor.gray,
                            fontWeight: FontWeight.w600),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          idpressed = false;
                          pwpressed = true;
                          pageController.jumpToPage(1);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent, elevation: 0),
                      child: Text(
                        "비밀번호",
                        style: TextStyle(
                            fontSize: 20.sp,
                            color:
                                pwpressed ? CommonColor.blue : CommonColor.gray,
                            fontWeight: FontWeight.w600),
                      )),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 207.w,
                  height: 2.h,
                  decoration: BoxDecoration(
                      color: idpressed ? CommonColor.blue : CommonColor.gray),
                ),
                Container(
                  width: 207.w,
                  height: 2.h,
                  decoration: BoxDecoration(
                      color: pwpressed ? CommonColor.blue : CommonColor.gray),
                ),
              ],
            ),
            Expanded(
                child: PageView(
              controller: pageController,
              onPageChanged: ((value) {
                setState(() {
                  page = value;
                });
                if (value == 0) {
                  setState(() {
                    idpressed = true;
                    pwpressed = false;
                  });
                } else {
                  setState(() {
                    idpressed = false;
                    pwpressed = true;
                  });
                }
              }),
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 30.w),
                          child: SizedBox(
                            width: 240.w,
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: '이메일',
                                enabledBorder: emailEmpty
                                    ? const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 1),
                                      )
                                    : const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                focusedBorder: emailEmpty
                                    ? const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 1),
                                      )
                                    : UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: CommonColor.blue, width: 1),
                                      ),
                                focusedErrorBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 5),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15.w, top: 20.h),
                          child: ElevatedButton(
                              onPressed: () {
                                email = _emailController.text;

                                if (email == "") {
                                  setState(() {
                                    emailEmpty = true;
                                  });
                                } else {
                                  setState(() {
                                    emailEmpty = false;
                                  });
                                }

                                if (emailEmpty) {
                                  print("에러발생");
                                } else {
                                  postequest(email);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.0, color: CommonColor.blue),
                                    borderRadius: BorderRadius.circular(20.h)),
                              ),
                              child: Text(
                                "인증번호 전송",
                                style: TextStyle(
                                    fontSize: 15.sp, color: CommonColor.blue),
                              )),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 30.w),
                          child: SizedBox(
                            width: 240.w,
                            child: TextField(
                              controller: _confirmController,
                              decoration: InputDecoration(
                                labelText: '인증번호 확인',
                                enabledBorder: confirmEmpty
                                    ? const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 1),
                                      )
                                    : const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                focusedBorder: confirmEmpty
                                    ? const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 1),
                                      )
                                    : UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: CommonColor.blue, width: 1),
                                      ),
                                focusedErrorBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 5),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15.w, top: 20.h),
                          child: ElevatedButton(
                              onPressed: buttonNull1
                                  ? null
                                  : () {
                                      confirm = _confirmController.text;
                                      if (confirm == "") {
                                        setState(() {
                                          confirmEmpty = true;
                                        });
                                      } else {
                                        setState(() {
                                          confirmEmpty = false;
                                        });
                                      }

                                      if (confirmEmpty) {
                                        print("에러발생");
                                      } else {
                                        getrequest(confirm);
                                      }
                                    },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                
                                backgroundColor: Colors.transparent,
                                minimumSize: Size(120.w, 37.h),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.0, color: CommonColor.blue),
                                    borderRadius: BorderRadius.circular(20.h)),
                              ),
                              child: Text(
                                "확인",
                                style: TextStyle(
                                    fontSize: 15.sp, color: CommonColor.blue),
                              )),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 30.w),
                          child: SizedBox(
                            width: 240.w,
                            child: TextField(
                              controller: _emailController1,
                              decoration: InputDecoration(
                                labelText: '이메일',
                                enabledBorder: emailEmpty1
                                    ? const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 1),
                                      )
                                    : const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                focusedBorder: emailEmpty1
                                    ? const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 1),
                                      )
                                    : UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: CommonColor.blue, width: 1),
                                      ),
                                focusedErrorBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 5),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15.w, top: 20.h),
                          child: ElevatedButton(
                              onPressed: () {
                                email1 = _emailController1.text;

                                if (email1 == "") {
                                  setState(() {
                                    emailEmpty1 = true;
                                  });
                                } else {
                                  setState(() {
                                    emailEmpty1 = false;
                                  });
                                }

                                if (emailEmpty1) {
                                  print("에러발생");
                                } else {
                                  postequest1(email1);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.0, color: CommonColor.blue),
                                    borderRadius: BorderRadius.circular(20.h)),
                              ),
                              child: Text(
                                "인증번호 전송",
                                style: TextStyle(
                                    fontSize: 15.sp, color: CommonColor.blue),
                              )),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 30.w),
                          child: SizedBox(
                            width: 240.w,
                            child: TextField(
                              controller: _confirmController1,
                              decoration: InputDecoration(
                                labelText: '인증번호 확인',
                                enabledBorder: confirmEmpty1
                                    ? const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 1),
                                      )
                                    : const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                focusedBorder: confirmEmpty1
                                    ? const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 1),
                                      )
                                    : UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: CommonColor.blue, width: 1),
                                      ),
                                focusedErrorBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 5),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15.w, top: 20.h),
                          child: ElevatedButton(
                              onPressed: buttonNull2
                                  ? null
                                  : () {
                                      confirm1 = _confirmController1.text;
                                      if (confirm1 == "") {
                                        setState(() {
                                          confirmEmpty1 = true;
                                        });
                                      } else {
                                        setState(() {
                                          confirmEmpty1 = false;
                                        });
                                      }

                                      if (confirmEmpty1) {
                                        print("에러발생");
                                      } else {
                                        getrequest1(confirm1);
                                      }
                                    },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                minimumSize: Size(120.w, 37.h),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.0, color: CommonColor.blue),
                                    borderRadius: BorderRadius.circular(20.h)),
                              ),
                              child: Text(
                                "확인",
                                style: TextStyle(
                                    fontSize: 15.sp, color: CommonColor.blue),
                              )),
                        )
                      ],
                    ),
                  ],
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}


