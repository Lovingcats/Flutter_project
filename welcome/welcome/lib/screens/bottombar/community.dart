import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welcome/common/common.dart';
import 'package:welcome/model/post.dart';
import 'package:welcome/widget/post_widget.dart';

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

  var firstOpacity = 1.0;

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
        backgroundColor: CommonColor.background,
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 21.w, top: 20.h),
                child: Row(
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
                          fontSize: 28.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
