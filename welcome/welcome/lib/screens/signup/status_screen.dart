import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:welcome/common/common.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:welcome/main.dart';
import 'package:welcome/provider/signupproivder.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  void postequest(var signupData) async {
    void toastmessage() {
      Fluttertoast.showToast(
          msg: "회원가입이 완료되었습니다",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.sp);
    }

    String url = 'http://13.125.225.199:8003/login/register';
    http.Response response =
        await http.post(Uri.parse(url), body: <String, String>{
      "name": signupData.name,
      "id": signupData.id,
      "pwd": signupData.pw,
      "email": signupData.email,
      "status": signupData.status,
      "grade": signupData.grade
    });
    if (response.statusCode == 200) {
      toastmessage();
      Navigator.push(context, MaterialPageRoute(builder: (_) => const Login()));
    }
  }

  int id = 0;
  final List<String> items = [
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    var signupData = Provider.of<SignupData>(context);

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
                    postequest(signupData);
                  },
                  child: Text("다음", style: TextStyle(fontSize: 24.sp)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: CommonColor.blue,
                      minimumSize: Size(414.w, 59.h)),
                )),
          ),
          body: Center(
            child: Column(children: [
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
                  "자신의 신분을 체크해주세요",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 14.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: id,
                      onChanged: (val) {
                        setState(() {
                          id = 1;
                          signupData.inputStatus("재학생");
                        });
                      },
                    ),
                    Text(
                      '재학생',
                      style: TextStyle(color: CommonColor.gray),
                    ),
                    Radio(
                      value: 2,
                      groupValue: id,
                      onChanged: (val) {
                        setState(() {
                          id = 2;
                          signupData.inputStatus("졸업생");
                        });
                      },
                    ),
                    Text(
                      '졸업생',
                      style: TextStyle(color: CommonColor.gray),
                    ),
                    Radio(
                      value: 3,
                      groupValue: id,
                      onChanged: (val) {
                        setState(() {
                          id = 3;
                          signupData.inputStatus("학부모");
                        });
                      },
                    ),
                    Text(
                      '학부모',
                      style: TextStyle(color: CommonColor.gray),
                    ),
                    Radio(
                      value: 4,
                      groupValue: id,
                      onChanged: (val) {
                        setState(() {
                          id = 4;
                          signupData.inputStatus("일반");
                        });
                      },
                    ),
                    Text(
                      '일반',
                      style: TextStyle(color: CommonColor.gray),
                    ),
                  ],
                ),
              ),
              if (id != 0)
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Row(
                      children: const [
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            '입학년도',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                        signupData.inputGrade(selectedValue as String);
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_drop_down,
                    ),
                    iconSize: 14.h,
                    iconEnabledColor: Colors.black,
                    iconDisabledColor: Colors.grey,
                    buttonHeight: 27.h,
                    buttonWidth: 150.w,
                    buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      color: Color(0xffFFFFFF),
                    ),
                    buttonElevation: 2,
                    itemHeight: 40.h,
                    itemPadding: const EdgeInsets.only(left: 14, right: 14),
                    dropdownMaxHeight: 200.h,
                    dropdownWidth: 200.w,
                    dropdownPadding: null,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white,
                    ),
                    dropdownElevation: 8,
                    scrollbarRadius: const Radius.circular(40),
                    scrollbarThickness: 6,
                    scrollbarAlwaysShow: true,
                    offset: const Offset(-20, 0),
                  ),
                ),
            ]),
          ),
        ));
  }
}
