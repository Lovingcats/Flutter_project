import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
        )
      ],
    );
  }
}
