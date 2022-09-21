import 'package:carousel_indicator/carousel_indicator.dart';
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
  int count = 1;  //ImageSlideShow를 위한 변수 count
  int pageIndex = 2;  // List<Widget> container의 배열을 이용하기 위한 변수 count

  List<Widget> containers = [ // container들의 list, 익명커뮤, 뜨근 조언등등을 list로 정리 
    GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.h))),
        margin: EdgeInsets.fromLTRB(61.w, 22.h, 61.w, 22.h),
        width: 292.w,
        height: 265.h,
        child: Padding(
          padding: EdgeInsets.all(23.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "뜨끈 조언",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30.sp),
              ),
              Text(
                "서로 조언을 주고 받을 수 있는\n커뮤니티",
                style: TextStyle(fontSize: 18.sp),
              ),
            ],
          ),
        ),
      ),
    ),
    GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.h))),
        margin: EdgeInsets.fromLTRB(61.w, 22.h, 61.w, 22.h),
        width: 292.w,
        height: 265.h,
        child: Padding(
          padding: EdgeInsets.only(top: 23.h, left: 23.w, right: 23.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "일반 커뮤니티",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30.sp),
              ),
              Text(
                "사람들과\n소통할 수 있는 커뮤니티",
                style: TextStyle(fontSize: 18.sp),
              ),
              SizedBox(
                height: 55.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    "images/community.png",
                    scale: 1.3,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ),
    GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.h))),
        margin: EdgeInsets.fromLTRB(61.w, 22.h, 61.w, 22.h),
        width: 292.w,
        height: 265.h,
        child: Padding(
          padding: EdgeInsets.all(23.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "익명 커뮤니티",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30.sp),
              ),
              Text(
                "사람들과 익명으로\n소통할 수 있는 공간",
                style: TextStyle(fontSize: 18.sp),
              ),
            ],
          ),
        ),
      ),
    ),
  ];

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
              ImageSlideshow( //이미지가 자동으로 넘어가는 위젯
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
                autoPlayInterval: 6000, //넘어가는 시간
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
                      "급식",
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
                      "시간표",
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
                      "학사일정",
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
                      "메타버스",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 310.h,
                color: CommonColor.blue,
                child: PageView( //pageview로 슬라이드 하면 넘어갈수 있게
                  children: containers,
                  onPageChanged: (index) {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                ),
              ),
              CarouselIndicator( //현 위젯이 어느 위치에 있는 알려주는 위젯, pageindex사용
                count: containers.length,
                index: pageIndex,
              )
            ],
          )
        ]));
  }
}
