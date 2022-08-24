import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welcome/common/common.dart';
import 'package:welcome/model/post.dart';

class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  List<Post> normalPosts = <Post>[];
  List<Post> blindPosts = <Post>[];
  List<Post> advicePosts = <Post>[];

  int count = 1;
  int view = 20;

  @override
  void initState() {
    super.initState();

    //db랑 연동해서 데이터 값 넣기

    for (int i = 1; i <= 10; i++) {
      normalPosts.add(Post("$i normalpost", view));
      blindPosts.add(Post("$i blindPosts", view));
      advicePosts.add(Post("$i advicePosts", view));
      view -= 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CommonColor.blue,
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 27.w, top: 25.h),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 9.w, right: 9.w, top: 9.h, bottom: 9.h),
                              child: Image.asset("images/community.png")),
                          width: 70.w,
                          height: 65.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.r))),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          "커뮤니티",
                          style: TextStyle(
                              fontSize: 24.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 276.w,
                      bottom: 30.h,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent, elevation: 0),
                          child: Row(
                            children: [
                              Image.asset("images/buttonIcon/pen.png"),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                "글쓰기",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                    decoration: TextDecoration.underline),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "일반",
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          minimumSize: Size(103.w, 40.h)),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "익명",
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          minimumSize: Size(103.w, 40.h)),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "뜨끈조언",
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          minimumSize: Size(103.w, 40.h)),
                    ),
                  ],
                ),
              ),
              Container(
                height: 70.w,
                child: Padding(
                  padding: EdgeInsets.only(left: 27.w, right: 27.w),
                  child: ListTile(
                    leading: Image.asset("images/buttonIcon/fire.png"),
                    tileColor: Colors.white,
                    title: Text("1 post"),
                    subtitle: Padding(
                        padding: EdgeInsets.only(left: 200.w),
                        child: Text(
                          "조회수 20",
                          style: TextStyle(fontSize: 12.sp),
                        )),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
