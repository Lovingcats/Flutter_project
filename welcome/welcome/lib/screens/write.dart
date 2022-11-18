import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:welcome/common/common.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:welcome/provider/signupproivder.dart';
import 'package:welcome/provider/userprovider.dart';

class Write extends StatefulWidget {
  final String which;
  const Write({Key? key, required this.which}) : super(key: key);

  @override
  State<Write> createState() => _WriteState();
}

class _WriteState extends State<Write> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  String title = '';
  String content = '';
  int private = 0;
  int hot = 0;

  void postequest(String title, String content, String name) async {
    select();
    try {
      String url = 'http://13.125.225.199:8003/test';
      http.Response response =
          await http.post(Uri.parse(url), body: <String, String>{
        "title": title,
        "contact": content,
        "isPrivate": "$private",
        "isNotice": "0",
        "isHot": "$hot",
        "userName": name,
      });
      var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
      print(parsingData);
      if (parsingData['success']) {
        Navigator.pop(context);
        toastmessage("글이 등록되었습니다");
      }
    } catch (e) {
      print(e);
    }
  }

  void select() {
    if (widget.which == "일반") {
      setState(() {
        hot = 0;
        private = 0;
      });
    } else if (widget.which == "익명") {
      setState(() {
        hot = 0;
        private = 1;
      });
    } else {
      setState(() {
        hot = 1;
        private = 0;
      });
    }
  }

  void toastmessage(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.sp);
  }

  @override
  Widget build(BuildContext context) {
    var userData = Provider.of<UserData>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
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
                    title = _titleController.text;
                    content = _contentController.text;
                    if (title == '') {
                      toastmessage("제목을 입력해주세요");
                    } else if (content == '') {
                      toastmessage("내용을 입력해주세요");
                    } else {
                      print(userData.userName);
                      postequest(title, content, userData.userName);
                      //post, get
                    }
                  });
                },
                child: Text("작성완료", style: TextStyle(fontSize: 24.sp)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: CommonColor.blue,
                    minimumSize: Size(414.w, 59.h)),
              )),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: widget.which == "뜨끈조언"
              ? Text(
                  "뜨끈조언",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 21.sp),
                )
              : Text(
                  "${widget.which} 커뮤니티",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 21.sp),
                ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 22.h,
              color: Colors.black,
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 36.h, left: 43.w, right: 43.w, bottom: 50.w),
                child: Container(
                  height: 45.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: const Color(0xffDFDFDF),
                      width: 2.0.w,
                    ),
                  ),
                  child: TextField(
                    controller: _titleController,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: '제목',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 12.w),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 43.w, right: 43.w),
                child: Container(
                  height: 450.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: const Color(0xffDFDFDF),
                      width: 2.0.w,
                    ),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    controller: _contentController,
                    maxLines: null,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: '글을 작성해주세요.',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 11..h, horizontal: 12.w),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
