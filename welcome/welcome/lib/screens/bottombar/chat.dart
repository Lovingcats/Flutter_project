import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welcome/widget/chatting.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
                padding: EdgeInsets.only(
                  left: 25.w,
                  top: 26.h,
                  right: 22.w,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15.h)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5.r),
                        spreadRadius: -3.r,
                        blurRadius: 7.r,
                        offset: Offset(0.w, 4.h), // changes position of shadow
                      ),
                    ],
                  ),
                  width: 67.w,
                  height: 67.h,
                  child: Image.asset("images/chat.png"),
                )),
            Text(
              "대화창",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.w, top: 20.h, bottom: 10.h),
          child: Text("현재 활동 중인 사용자들",
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 63.h,
          child: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: ListView(scrollDirection: Axis.horizontal, children: [
              Icon(
                Icons.circle,
                size: 63.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Icon(
                Icons.circle,
                size: 63.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Icon(
                Icons.circle,
                size: 63.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Icon(
                Icons.circle,
                size: 63.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Icon(
                Icons.circle,
                size: 63.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Icon(
                Icons.circle,
                size: 63.h,
              ),
              SizedBox(
                width: 10.w,
              ),
            ]),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 1.h,
              width: 377.w,
              color: const Color(0xffD9D9D9),
            ),
          ],
        ),
        SizedBox(
          height: 17.h,
        ),
        const Chatting()
      ],
    );
  }
}
