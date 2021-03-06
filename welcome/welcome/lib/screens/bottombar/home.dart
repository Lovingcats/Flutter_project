
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welcome/common/common.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 23.w, top: 10.h, bottom: 10.h),
                child: Text(
                  "WELBATO",
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: CommonColor.blue,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          Stack(
            children: [
              ImageSlideshow(
                width: double.infinity,
                height: 205.h,
                initialPage: 0,
                indicatorColor: Colors.blue,
                indicatorBackgroundColor: Colors.grey,
                onPageChanged: (value) {
                  setState(() {
                    count = value + 1;
                  });
                },
                autoPlayInterval: 6000,
                isLoop: true,
                children: [
                  Image.asset(
                    'images/slideshow/show1.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'images/slideshow/show1.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'images/slideshow/show1.png',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              Positioned(
                  left: 366.w,
                  top: 180.h,
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff656565),
                        border: Border.all(
                          color: const Color(0xff656565),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20.h))),
                    height: 18.w,
                    width: 41.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "$count",
                          style:
                              TextStyle(fontSize: 10.sp, color: Colors.white),
                        ),
                        Text(
                          "/3",
                          style:
                              TextStyle(fontSize: 10.sp, color: Colors.white),
                        )
                      ],
                    ),
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 13.h, left: 28.w, right: 28.w, bottom: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Image.asset("images/buttonIcon/eat.png"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: Size(67.w, 67.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23.h)),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "??????",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Image.asset("images/buttonIcon/time.png"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: Size(67.w, 67.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23.h)),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "?????????",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Image.asset("images/buttonIcon/calender.png"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: Size(67.w, 67.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23.h)),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "????????????",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Image.asset("images/buttonIcon/meta.png"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: Size(67.w, 67.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23.h)),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "????????????",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]));
  }
}