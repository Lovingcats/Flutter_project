import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welcome/common/common.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class Buttons extends StatefulWidget {
  final String url;
  final String name;
  // ignore: prefer_typing_uninitialized_variables
  final where;
  const Buttons({Key? key, required this.url, required this.name, this.where})
      : super(key: key);

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => widget.where));
          },
          child: Image.asset(widget.url),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            minimumSize: Size(67.w, 67.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.r)),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          widget.name,
          style: TextStyle(
              fontSize: 13.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
