import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:welcome/common/common.dart';
import 'package:welcome/provider/signupproivder.dart';
import 'package:welcome/screens/signup/pw_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ID extends StatefulWidget {
  const ID({Key? key}) : super(key: key);

  @override
  State<ID> createState() => _IDState();
}

class _IDState extends State<ID> {
  final _idController = TextEditingController(); //textfield를 위한 컨트롤러
  String id = '';
  bool error = false;
  bool isEmpty = false;

  void toastmessage() {
    Fluttertoast.showToast(
        msg: "아이디가 중복입니다. 다시 입력해주세요",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.sp);
  }

  void getrequest(var id) async {
    
    String url = 'http://13.125.225.199:8003/login/idCheck?userId=$id';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
      setState(() {
        error = !parsingData["success"];
        print(error);
      });
      error
          ? toastmessage()
          : Navigator.push(
              context, MaterialPageRoute(builder: (_) => const PW()));
    }
  }

  @override
  Widget build(BuildContext context) {
    var signupData = Provider.of<SignupData>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); //화면을 클릭하면 키보드가 내려감
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
                    id = _idController.text;

                    if (id == "") {
                      isEmpty = true;
                    } else {
                      isEmpty = false;
                    }
                    if (isEmpty) {
                      print("에러발생");
                    } else {
                      print(id);
                      signupData.inputId(id);
                      getrequest(id);
                    }
                  });
                },
                child: Text("다음", style: TextStyle(fontSize: 24.sp)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: CommonColor.blue,
                    minimumSize: Size(414.w, 59.h)),
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
                    top: 25.h, left: 22.w, bottom: 27.h, right: 131.w),
                child: Text(
                  "사용할 아이디를 입력해주세요",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 28.w, right: 28.w, bottom: 8.h),
                child: TextField(
                  controller: _idController,
                  decoration: InputDecoration(
                    labelText: 'ID',
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
                  ),
                ),
              ),
              Text(
                isEmpty ? "아이디를 입력해주세요" : "",
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
