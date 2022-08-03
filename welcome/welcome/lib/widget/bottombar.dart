import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welcome/common/common.dart';

class Bottom{
  static Widget bottomBar() {
    return SizedBox(
      height: 60.h,
      child: Material(
        color: Colors.transparent,
        child: TabBar(
          labelColor: CommonColor.blue,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.transparent,
          tabs: [
            Tab(
              icon: Icon(
                Icons.home,
                size: 18.h,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.groups,
                size: 18.h,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.school,
                size: 18.h,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.chat_bubble,
                size: 18.h,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.account_circle_rounded,
                size: 18.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}