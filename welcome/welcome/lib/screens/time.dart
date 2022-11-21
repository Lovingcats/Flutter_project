// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:convert';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:welcome/common/common.dart';

class Time extends StatefulWidget {
  const Time({Key? key}) : super(key: key);

  @override
  State<Time> createState() => _SiganapiState();
}

class _SiganapiState extends State<Time> {
  String result = '';
  bool isMonday = true;
  bool isTuesday = false;
  bool isWednesday = false;
  bool isThursday = false;
  bool isFriday = false;
  late List<bool> isSelected;
  bool isLoading = true;
  String firstclass = "";
  String secondclass = "";
  String thirdclass = "";
  String fourthclass = "";
  String fifthclass = "";
  String sixthclass = "";
  String sevenclass = "";
  String grade = "";
  String classes = "";
  @override
  void initState() {
    isSelected = [isMonday, isTuesday, isWednesday, isThursday, isFriday];
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    final response = await http.get(Uri.parse(
        'http://13.125.225.199:8002/api/school/neisAPI/timeline?grade=$grade&classs=$classes'));
    var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
    setState(() {
      isLoading = false;
      firstclass = parsingData[0]['study'];
      secondclass = parsingData[1]['study'];
      thirdclass = parsingData[2]['study'];
      fourthclass = parsingData[3]['study'];
      fifthclass = parsingData[4]['study'];
      sixthclass = parsingData[5]['study'];
      sevenclass = parsingData[6]['study'];
    });
    if (response.statusCode == 200) {
      print('Success');
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? SpinKitHourGlass(color: CommonColor.blue)
          : Column(
              children: [
                Container(
                  width: 430.w,
                  height: 180.h,
                  child: Stack(
                    children: [
                      // ignore: sized_box_for_whitespace
                      Container(
                        margin: const EdgeInsets.fromLTRB(25, 25, 0, 0),
                        width: 90.w,
                        height: 80.h,
                        child: Image.asset(
                          'images/haks.png',
                        ),
                        decoration: BoxDecoration(
                            color: const Color(0xffF9F9F9), //테두리
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                                color: const Color(0xffF9F9F9), width: 7),
                            boxShadow: [
                              // ignore: prefer_const_constructors
                              BoxShadow(
                                color: Colors.indigo.shade200,
                                offset: const Offset(6.0, 8.0),
                                blurRadius: 2.0,
                                spreadRadius: 0.3,
                              ),
                            ]),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 28, 0, 0),
                        child: Column(
                          children: [
                            // ignore: avoid_unnecessary_containers
                            Container(
                              child: Text(
                                '시간표',
                                style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 150.w),
                                  width: 100.w,
                                  child: DropdownButtonFormField<String?>(
                                    decoration: InputDecoration(
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                    ),
                                    onChanged: (String? newValue) {
                                      print(newValue);
                                      setState(() {
                                        if (newValue == null) {
                                          grade = "1";
                                        } else
                                          grade = "2";
                                        fetchPosts();
                                      });
                                    },
                                    items: [null, '1']
                                        .map<DropdownMenuItem<String?>>(
                                            (String? i) {
                                      return DropdownMenuItem<String?>(
                                        value: i,
                                        child: Text(
                                          {'1': '2학년'}[i] ?? '1학년',
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Colors.black),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10.w),
                                  width: 100.w,
                                  child: DropdownButtonFormField<String?>(
                                    decoration: InputDecoration(
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                    ),
                                    onChanged: (String? newValue) {
                                      print(newValue);
                                      setState(() {
                                        if (newValue == null)
                                          classes = "1";
                                        else if (newValue == '1')
                                          classes = "2";
                                        else if (newValue == '2')
                                          classes = "3";
                                        else
                                          classes = "4";
                                        fetchPosts();
                                      });
                                    },
                                    items: [null, '1', '2', '3']
                                        .map<DropdownMenuItem<String?>>(
                                            (String? i) {
                                      return DropdownMenuItem<String?>(
                                        value: i,
                                        child: Text(
                                          {
                                                '1': '2반',
                                                '2': '3반',
                                                '3': '4반'
                                              }[i] ??
                                              '1반',
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Colors.black),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    color: Color(0xff9EC3FF),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, top: 20.h),
                      child: Column(children: [
                        Container(
                            width: 50.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Color(0xffFFEE95),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 18.w,
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 20),
                            width: 50.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Color(0xffFFEE95),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 18.w,
                                ),
                                Text(
                                  '2',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 20),
                            width: 50.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Color(0xffFFEE95),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 18.w,
                                ),
                                Text(
                                  '3',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 20),
                            width: 50.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Color(0xffFFEE95),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 18.w,
                                ),
                                Text(
                                  '4',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 20),
                            width: 50.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Color(0xffFFEE95),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 18.w,
                                ),
                                Text(
                                  '5',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 20),
                            width: 50.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Color(0xffFFEE95),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 18.w,
                                ),
                                Text(
                                  '6',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 20),
                            width: 50.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Color(0xffFFEE95),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 18.w,
                                ),
                                Text(
                                  '7',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )),
                      ]),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 18.h)),
                          Container(
                            margin: EdgeInsets.only(left: 30.w),
                            child: Text(
                              firstclass,
                              style: TextStyle(fontSize: 23.sp),
                            ),
                          ),
                          SizedBox(
                            height: 41.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30.w),
                            child: Text(
                              secondclass,
                              style: TextStyle(fontSize: 23.sp),
                            ),
                          ),
                          SizedBox(
                            height: 41.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30.w),
                            child: Text(
                              thirdclass,
                              style: TextStyle(fontSize: 23.sp),
                            ),
                          ),
                          SizedBox(
                            height: 41.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30.w),
                            child: Text(
                              fourthclass,
                              style: TextStyle(fontSize: 23.sp),
                            ),
                          ),
                          SizedBox(
                            height: 41.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30.w),
                            child: Text(
                              fifthclass,
                              style: TextStyle(fontSize: 23.sp),
                            ),
                          ),
                          SizedBox(
                            height: 41.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30.w),
                            child: Text(
                              sixthclass,
                              style: TextStyle(fontSize: 23.sp),
                            ),
                          ),
                          SizedBox(
                            height: 41.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30.w),
                            child: Text(
                              sevenclass,
                              style: TextStyle(fontSize: 23.sp),
                            ),
                          ),
                        ]),
                  ],
                ),
              ],
            ),
    );
  }
}
