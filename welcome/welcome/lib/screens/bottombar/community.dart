import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:welcome/common/common.dart';
import 'package:welcome/model/post.dart';
import 'package:welcome/provider/postprovider.dart';
import 'package:welcome/screens/write.dart';
import 'package:welcome/widget/post_widget.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  List<Post> normalPosts = <Post>[];
  List<Post> blindPosts = <Post>[];
  List<Post> advicePosts = <Post>[];
  PageController pageController = PageController(
    initialPage: 0,
  );
  int count = 1;
  int view = 20;
  int page = 0;
  bool ispressed1 = true;
  bool ispressed2 = false;
  bool ispressed3 = false;
  bool isLoading = true;
  var postData;
  int length = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      postData = Provider.of<PostProviderData>(context, listen: false);
    });
    //db랑 연동해서 데이터 값 넣기

    getrequest();
  }

  void getrequest() async {
    String url = 'http://13.125.225.199:8003/all_contect';
    http.Response response = await http.get(Uri.parse(url));
    var parsingData = jsonDecode(utf8.decode(response.bodyBytes));

    print(parsingData);

    if (response.statusCode == 200) {
      if (parsingData["success"] == true) {
        count = parsingData['length'];
        postData.clearly();
        for (int i = 0; i < count; i++) {
          String title = "";
          int views = 0;
          String contact = "";
          int heart = 0;
          int isNotice = 0;
          int isPrivate = 0;
          int isHot = 0;
          String userName = "";
          try {
            title = parsingData['data'][i]['title'];
            views = parsingData['data'][i]['isNotice'];
            contact = parsingData['data'][i]['contact'];
            heart = parsingData['data'][i]['heart'];
            //1회성 확인
            isNotice = parsingData['data'][i]['isNotice'];
            isPrivate = parsingData['data'][i]['isPrivate'];
            isHot = parsingData['data'][i]['isHot'];
            userName = parsingData['data'][i]['userName'];
            if (isPrivate == 0 && isHot == 0) {
              postData.inputNormalData(title, views, contact, heart, userName);
            } else if (isPrivate == 1) {
              postData.inputBlindData(title, views, contact, heart, userName);
            } else {
              postData.inputAdviceData(title, views, contact, heart, userName);
            }
            setState(() {
              isLoading = false;
            });
          } catch (e) {
            print(e.toString());
          }
        }
      } else {
        PostError();
      }
    } else {
      PostError();
    }
  }

  void PostError() {
    //toast메세지 띄워주는 함수
    Fluttertoast.showToast(
        msg: "불러오기 실패했습니다",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.red.withOpacity(0.4),
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    var postProviderData = Provider.of<PostProviderData>(context);
    return Scaffold(
        backgroundColor: CommonColor.background,
        body: isLoading
            ? Center(
                child: SpinKitHourGlass(color: CommonColor.blue),
              )
            : Center(
                child: SingleChildScrollView(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 27.w, top: 25.h),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 9.w,
                                        right: 9.w,
                                        top: 9.h,
                                        bottom: 9.h),
                                    child: Image.asset("images/community.png")),
                                width: 70.w,
                                height: 65.h,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.r))),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Text(
                                "커뮤니티",
                                style: TextStyle(
                                    fontSize: 24.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Positioned(
                            left: 290.w,
                            bottom: 30.h,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    elevation: 0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (ispressed1 == true) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => const Write(
                                                        which: "일반",
                                                      )));
                                        } else if (ispressed2 == true) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => const Write(
                                                        which: "익명",
                                                      )));
                                        } else {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => const Write(
                                                        which: "뜨끈조언",
                                                      )));
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          elevation: 0.0),
                                      child: Text(
                                        "글쓰기",
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.black,
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                    )
                                  ],
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 27.w, right: 27.w, top: 25.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                              bottom: BorderSide(
                                  width: 1.w,
                                  color: ispressed1
                                      ? CommonColor.blue
                                      : Colors.white),
                            )),
                            height: 40.h,
                            width: 120.w,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  ispressed1 = true;
                                  ispressed2 = false;
                                  ispressed3 = false;
                                  pageController.jumpToPage(0);
                                });
                              },
                              child: Text(
                                "일반",
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ispressed1
                                    ? const Color(0xffEFEFEF)
                                    : Colors.white,
                                elevation: 0.0,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                              bottom: BorderSide(
                                  width: 1.w,
                                  color: ispressed2
                                      ? CommonColor.blue
                                      : Colors.white),
                            )),
                            height: 40.h,
                            width: 120.w,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  ispressed1 = false;
                                  ispressed2 = true;
                                  ispressed3 = false;
                                  pageController.jumpToPage(1);
                                });
                              },
                              child: Text(
                                "익명",
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ispressed2
                                    ? const Color(0xffEFEFEF)
                                    : Colors.white,
                                elevation: 0.0,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                              bottom: BorderSide(
                                  width: 1.w,
                                  color: ispressed3
                                      ? CommonColor.blue
                                      : Colors.white),
                            )),
                            height: 40.h,
                            width: 120.w,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  ispressed1 = false;
                                  ispressed2 = false;
                                  ispressed3 = true;
                                  pageController.jumpToPage(2);
                                });
                              },
                              child: Text(
                                "뜨끈조언",
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ispressed3
                                    ? const Color(0xffEFEFEF)
                                    : Colors.white,
                                elevation: 0.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100000.h, //식 세우기
                    child: PageView(
                      controller: pageController,
                      onPageChanged: ((value) {
                        try {
                          if (value == 0) {
                            setState(() {
                              ispressed1 = true;
                              ispressed2 = false;
                              ispressed3 = false;
                            });
                          } else if (value == 1) {
                            setState(() {
                              ispressed1 = false;
                              ispressed2 = true;
                              ispressed3 = false;
                            });
                          } else {
                            setState(() {
                              ispressed1 = false;
                              ispressed2 = false;
                              ispressed3 = true;
                            });
                          }
                        } catch (e) {
                          print(e.toString());
                        }
                      }),
                      children: [
                        Post_widget(
                          posts: postProviderData.normalPosts,
                        ),
                        Post_widget(
                          posts: postProviderData.blindPosts,
                        ),
                        Post_widget(
                          posts: postProviderData.advicePosts,
                        ),
                      ],
                    ),
                  )
                ]),
              )));
  }
}
