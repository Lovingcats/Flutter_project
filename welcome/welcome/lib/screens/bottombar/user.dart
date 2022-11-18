import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welcome/main.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 76.h,
          ),
          Icon(
            Icons.account_circle,
            color: const Color(0xffD9D9D9),
            size: 97.h,
          ),
          SizedBox(height: 164.h),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const Login()));
              },
              child: Text(
                "로그인 하러 가기",
                style: TextStyle(
                    fontSize: 20.sp,
                    decoration: TextDecoration.underline,
                    color: Colors.black),
              ))
        ],
      ),
    );
  }
}
