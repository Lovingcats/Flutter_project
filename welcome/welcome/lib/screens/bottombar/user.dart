import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:welcome/main.dart';
import 'package:welcome/provider/userprovider.dart';
import 'package:welcome/screens/login.dart';


class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {

  

  @override
  Widget build(BuildContext context) {
    var userData = Provider.of<UserData>(context);
    return userData.login
        ? Center(
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
                Padding(
                  padding: EdgeInsets.only(top: 10.h, bottom: 130.h),
                  child: Text(
                    userData.userName + "님",
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      userData.loginChange(false);
                    });
                  },
                  child: const Text("로그아웃"),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                ),
              ],
            ),
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const Login()));
                    },
                    child: Text(
                      "로그인 하러 가기",
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.w500),
                    ))
              ],
            ),
          );
  }
}
