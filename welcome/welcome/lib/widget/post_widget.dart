import 'package:flutter/material.dart';
import 'package:welcome/model/post.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: camel_case_types
class Post_widget extends StatefulWidget {
  final List<Post> posts;
  const Post_widget({Key? key, required this.posts}) : super(key: key);

  @override
  State<Post_widget> createState() => _Post_widgetState();
}

// ignore: camel_case_types
class _Post_widgetState extends State<Post_widget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: makePost(context, widget.posts),
    );
  }
}

List<Widget> makePost(BuildContext context, List<Post> posts) {
  List<Widget> results = [];

  for (var i = 0; i < posts.length; i++) {
    results.add(
      Padding(
        padding: EdgeInsets.only(left: 27.w, right: 27.w, top: 19.h),
        child: GestureDetector(
          onTap: () {
            print("hello");
          },
          child: Container(
            padding: EdgeInsets.only(left: 9.w, right: 11.w),
            width: 360.w,
            height: 47.h,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xffDADADA)),
                borderRadius: BorderRadius.all(Radius.circular(10.r))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 188.w,
                  child: Text(
                    posts[i].title,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                Text(
                  "조회수·${posts[i].views}",
                  style: TextStyle(
                      fontSize: 9.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  return results;
}
