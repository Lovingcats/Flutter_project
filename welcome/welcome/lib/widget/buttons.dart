import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welcome/common/common.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class Buttonss extends StatefulWidget {
  final String url;
  final String name;
  final String content1;
  final String content2;
  // ignore: prefer_typing_uninitialized_variables
  final where;
  const Buttonss({
    Key? key,
    required this.url,
    required this.name,
    this.where,
    required this.content1,
    required this.content2,
  }) : super(key: key);

  @override
  State<Buttonss> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttonss> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => widget.where));
      },
      child: Container(
        width: 175.w,
        height: 170.h,
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color(0xff000000).withOpacity(0.6), width: 0.5.w),
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.h, left: 12.w, top: 15.h),
            child: Row(
              children: [
                Image.asset(widget.url),
                SizedBox(
                  width: 12.w,
                ),
                Text(
                  widget.name,
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w900),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.content1,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                Text(
                  widget.content2,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
