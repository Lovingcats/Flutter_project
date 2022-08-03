import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("User Page", style: TextStyle(fontSize: 40.sp),)
      ],
    );
  }
}
