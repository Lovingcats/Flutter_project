import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:welcome/provider/postprovider.dart';
import 'package:like_button/like_button.dart';
import 'package:http/http.dart' as http;

class Read extends StatefulWidget {
  final String content;
  final int heart;
  final String writer;
  final String title;
  final int id;
  const Read(
      {Key? key,
      required this.content,
      required this.heart,
      required this.writer,
      required this.title,
      required this.id})
      : super(key: key);

  @override
  State<Read> createState() => _ReadState();
}

class _ReadState extends State<Read> {
  var heartcount; 

  @override
  void initState() {
    print(heartcount);
    heartcount = widget.heart;
    super.initState();
  }

  void getrequest() async {
    String url =
        'http://13.125.225.199:8003/heart_change?id=${widget.id}&heart=${widget.heart}';
    http.Response response = await http.get(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 24.h,
            )),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 23.w, right: 23.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style:
                      TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w700),
                ),
                Container(
                  margin: EdgeInsets.only(top: 18.h, bottom: 18.h),
                  height: 1.h,
                  width: double.infinity,
                  color: Colors.black,
                ),
                Text(
                  widget.content,
                  style: TextStyle(fontSize: 18.sp, color: Colors.black),
                ),
                SizedBox(
                  height: 50.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(""),

                    // Text(
                    // widget.writer,
                    // style: TextStyle(
                    //    fontSize: 18.sp, fontWeight: FontWeight.w500),
                    //),
                    InkWell(
                      onTap: () {
                        heartcount++;
                      },
                      child: LikeButton(
                        likeCount: heartcount,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
