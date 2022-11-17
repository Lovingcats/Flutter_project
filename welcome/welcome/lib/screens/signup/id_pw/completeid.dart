import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welcome/common/common.dart';
import 'package:welcome/main.dart';
import 'package:welcome/screens/signup/id_pw/idtodart.dart';

class CompleteId extends StatefulWidget {
  final String findid;
  final String findemail;
  const CompleteId({Key? key, required this.findid, required this.findemail})
      : super(key: key);

  @override
  State<CompleteId> createState() => _CompleteIdState();
}

class _CompleteIdState extends State<CompleteId> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 22.h,
            )),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 26.h, bottom: 35.h),
            child: Text(
              "아이디 찾기가 완료되었습니다",
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 34.w, right: 100.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "아이디",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff5B5A5A)),
                ),
                Text(
                  widget.findid,
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff5B5A5A)),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 34.w, right: 34.w, top: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "이메일",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff5B5A5A)),
                ),
                Text(
                  widget.findemail,
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff5B5A5A)),
                )
              ],
            ),
          ),
          SizedBox(
            height: 410.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Login()));
                  },
                  child: Text("로그인", style: TextStyle(fontSize: 24.sp)),
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      side: BorderSide(color: CommonColor.blue, width: 1.w),
                      backgroundColor: CommonColor.blue,
                      minimumSize: Size(179.w, 56.h)),
                ),
                SizedBox(
                  width: 15.w,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const IdToEmail()));
                  },
                  child: Text("비밀번호 찾기",
                      style:
                          TextStyle(fontSize: 24.sp, color: CommonColor.blue)),
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      side: BorderSide(color: CommonColor.blue, width: 1.w),
                      backgroundColor: Colors.white,
                      minimumSize: Size(179.w, 56.h)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
