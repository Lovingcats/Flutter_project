import 'package:flutter/material.dart';
import 'package:welcome/model/post.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: camel_case_types
class Post_widget extends StatefulWidget {
  final List<Post> posts;

  const Post_widget({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  State<Post_widget> createState() => _Post_widgetState();
}

// ignore: camel_case_types
class _Post_widgetState extends State<Post_widget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.posts.length,
        itemBuilder: (context, index) {
          return Container(
            height: 80.w,
            child: Padding(
              padding: EdgeInsets.only(left: 27.w, right: 27.w, bottom: 15.h),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                visualDensity: VisualDensity(vertical: -4),
                leading: Image.asset("images/buttonIcon/fire.png"),
                tileColor: Colors.white,
                title: Text(widget.posts[index].title),
                subtitle: Padding(
                    padding: EdgeInsets.only(left: 200.w),
                    child: Text(
                      "조회수 ${widget.posts[index].views}",
                      style: TextStyle(fontSize: 12.sp),
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}
