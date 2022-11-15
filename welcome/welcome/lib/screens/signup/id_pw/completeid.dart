import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welcome/common/common.dart';

class CompleteId extends StatefulWidget {
  const CompleteId({Key? key}) : super(key: key);

  @override
  State<CompleteId> createState() => _CompleteIdState();
}

class _CompleteIdState extends State<CompleteId> {
  bool idpressed = true;
  bool pwpressed = false;
  String id = 'soo5289';
  String email = '202110306@bssm.hs.kr';

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
            padding: EdgeInsets.only(left: 55.w, right: 55.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        idpressed = true;
                        pwpressed = false;
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
                  id,
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
                  email,
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff5B5A5A)),
                )
              ],
            ),
          ),
          SizedBox(
            height: 400.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const CompleteId()));
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
                        MaterialPageRoute(builder: (_) => const CompleteId()));
                  },
                  child: Text("회원가입",
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
