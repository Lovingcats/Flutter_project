import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:welcome/common/common.dart';
import 'package:welcome/provider/signupproivder.dart';
import 'package:welcome/screens/signup/email_screen.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class Name extends StatefulWidget {
  const Name({Key? key}) : super(key: key);

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  final _nameController = TextEditingController(); //textfield를 위한 컨트롤러
  String name = '';
  bool error = false;
  bool isempty = false;
  bool ispressed = false;

  void toastmessage() {
    Fluttertoast.showToast(
        msg: "이름이 중복입니다. 다시 입력해주세요",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.sp);
  }

  void getrequest(var name) async {
    print("실행됨");
    String url = 'http://13.125.225.199:8003/login/check?name=$name';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
      setState(() {
        error = !parsingData["success"];
      });
      error
          ? toastmessage()
          : Navigator.push(
              context, MaterialPageRoute(builder: (_) => const Email()));
    }
  }

  @override
  Widget build(BuildContext context) {
    var signupData = Provider.of<SignupData>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // 화면을 클릭하면 키보드 내려감
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
                    name = _nameController.text;

                    if (name == "") {
                      isempty = true;
                    } else {
                      isempty = false;
                    }
                    if (isempty) {
                      print("에러발생");
                    } else {
                      print(name);
                      signupData.inputName(name);
                      getrequest(name);
                    }
                  });
                },
                child: Text("다음", style: TextStyle(fontSize: 24.sp)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: CommonColor.blue,
                    minimumSize: Size(414.w, 59.h)),
              )),
        ),
        body: ProgressHUD(
          child: Center(
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
                      top: 25.h, left: 20.w, bottom: 27.h, right: 149.w),
                  child: Text(
                    "자신의 이름을 입력해주세요",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 28.w, right: 28.w),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      enabledBorder: isempty
                          ? const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1),
                            )
                          : error
                              ? const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1),
                                )
                              : const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                      focusedBorder: isempty
                          ? const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1),
                            )
                          : error
                              ? const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1),
                                )
                              : UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: CommonColor.blue, width: 1),
                                ),
                    ),
                  ),
                ),
                Text(
                  isempty ? "이름을 입력해주세요" : "",
                  style: TextStyle(fontSize: 12.sp, color: Colors.red),
                ),
                SizedBox(
                  height: 490.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
