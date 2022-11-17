import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welcome/common/common.dart';

class Bottom {
  static Widget bottomBar() {
    return SizedBox(
      height: 60.h, // 바텀바 높이
      child: Material(
        color: Colors.transparent, //바텀바의 색깔을 부모 위젯의 색과 같게 만들어주는 코드
        child: TabBar(
          labelColor: CommonColor.blue,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.transparent,
          tabs: [
            //tab 5개
            Tab(
              icon: Icon(
                Icons.home,
                size: 25.h,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.school,
                size: 25.h,
              ),
            ),  
            Tab(
              icon: Icon(
                Icons.groups,
                size: 25.h,
              ),
            ),                                                                                                             
            Tab(
              icon: Icon(
                Icons.account_circle_rounded,
                size: 25.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
