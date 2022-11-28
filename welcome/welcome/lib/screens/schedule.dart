// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:welcome/common/common.dart';


class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _MyHomePageState();
}

// ignore: unnecessary_new
var now = new DateTime.now();

class _MyHomePageState extends State<Schedule> {
  bool isLoading = true;
  String t1 = "";
  String t2 = "";
  String t3 = "";
  String t4 = "";
  String t5 = "";
  String t6 = "";
  String t7 = "";
  String t8 = "";
  String t9 = "";
  String t10 = "";
  String t11 = "";
  String t12 = "";
  String t13 = "";
  String t14 = "";
  String t15 = "";
  String t16 = "";
  String t17 = "";
  String t18 = "";
  String t19 = "";
  String t20 = "";
  String t21 = "";
  String t22 = "";
  String t23 = "";
  String t24 = "";
  String t25 = "";
  String t26 = "";
  String t27 = "";
  String t28 = "";
  String t29 = "";
  String t30 = "";
  String t31 = "";
  String Month = DateFormat('M').format(now);
  String Day = DateFormat('d').format(now);
  var swith = 0;
  @override
  initState() {
    super.initState();
    fetchPosth();
    monthCatch();
  }

  Future<void> fetchPosth() async {
    final response = await http.get(Uri.parse(
        'http://13.125.225.199:8001/api/school/neisAPI/Schedule?year=2022&month=11'));
    var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
    setState(() {
     t1 = parsingData[0]['day'];
      t2 = parsingData[1]['day'];
      t3 = parsingData[2]['day'];
      t4 = parsingData[3]['day'];
      t5 = parsingData[4]['day'];
      t6 = parsingData[5]['day'];
      t7 = parsingData[6]['day'];
      t8 = parsingData[7]['day'];
      t9 = parsingData[8]['day'];
      t10 = parsingData[9]['day'];
      t11 = parsingData[10]['day'];
      t12 = parsingData[11]['day'];
      t13 = parsingData[12]['day'];
      t14 = parsingData[13]['day'];
      t15 = parsingData[14]['day'];
      t16 = parsingData[15]['day'];
      t17 = parsingData[16]['day'];
      t18 = parsingData[17]['day'];
      t19 = parsingData[18]['day'];
      t20 = parsingData[19]['day'];
      t21 = parsingData[20]['day'];
      t22 = parsingData[21]['day'];
      t23 = parsingData[22]['day'];
      t24 = parsingData[23]['day'];
      t25 = parsingData[24]['day'];
      t26 = parsingData[25]['day'];
      t27 = parsingData[26]['day'];
      t28 = parsingData[27]['day'];
      t29 = parsingData[28]['day'];
      t30 = parsingData[29]['day'];
      isLoading = false;
    });
    if (response.statusCode == 200) {
      print('Success');
    } else {
      throw Exception('Failed to load post');
    }
  }

  monthCatch() {
    if (Month == '11') {
      return 45.w;
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: isLoading
          ? SpinKitHourGlass(color: CommonColor.blue)
          : Column(
              children: [
                //FLEXIBLE을 이용하여 화면이 어떻게 달라져도 자동
                Flexible(
                  child: Row(
                    children: [
                      // ignore: sized_box_for_whitespace
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                        height: 75.h,
                        child: Image.asset('images/time.png'),
                        decoration: BoxDecoration(
                            color: const Color(0xffF9F9F9), //테두리
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                                color: const Color(0xffF9F9F9), width: 7.w),
                            boxShadow: [
                              // ignore: prefer_const_constructors
                              BoxShadow(
                                color: Colors.grey.shade500,
                                offset: const Offset(0, 5.0),
                                blurRadius: 5.0,
                                spreadRadius: 0.3,
                              ),
                              const BoxShadow(
                                color: Colors.white,
                                offset: Offset(-1.0, -1.0),
                                blurRadius: 10.0,
                                spreadRadius: 1.0,
                              ),
                            ]),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                        child: Text(
                          '학사일정 \n'
                          '$Month월 ',
                          style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                 SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: 375.w,
                  height: 530.h,
                  child: Column(
                    children: [
                      Container(
                        width: 350.w,
                        height: 30.h,
                        margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                'SUN  ',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15.sp
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                ' MON  ',
                                style: TextStyle(fontSize: 15.sp),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                ' TUE  ',
                                style: TextStyle(fontSize: 15.sp),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                ' WED  ',
                                style: TextStyle(fontSize: 15.sp),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                ' THU  ',
                                style: TextStyle(fontSize: 15.sp),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                ' FRI  ',
                                style: TextStyle(fontSize: 15.sp),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                ' SAT',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15.sp,
                                ),
                              )
                            ]),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20), //모서리를 둥글게
                          border: Border.all(color: Colors.black, width: 1.w),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10.h, 0, 0),
                        padding: EdgeInsets.fromLTRB(10.w, 10.h, 0, 0),
                        width: 355.w,
                        height: 365.h,
                        child: Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.start,
                          spacing: 2.w,
                          runSpacing: 15.h,
                          children: [
                            SizedBox(
                              width: monthCatch(),
                            ),
                            Container(
                              width: 45.w,
                              child: Text('1\n$t1',
                                  style: TextStyle(fontSize: 11.sp,)),
                            ),
                            Container(
                              width: 45.w,
                              child: Text('2\n$t2',
                                  style: TextStyle(fontSize: 11.sp,)),
                            ),
                            Container(
                              width: 45.w,
                              child: Text('3\n$t3',
                                  style: TextStyle(fontSize: 11.sp,)),
                            ),
                            Container(
                              width: 45.w,
                              child: Text('4\n$t4',
                                  style: TextStyle(fontSize: 11.sp,)),
                            ),
                            Container(
                              width: 45.w,
                              child: Text('5\n$t5',
                                  style: TextStyle(fontSize: 11.sp,)),
                            ),
                            Container(
                              width: 45.w,
                              child: Text('6\n$t6',
                                  style: TextStyle(fontSize: 11.sp,)),
                            ),
                            Container(
                              width: 45.w,
                              child: Text(
                                '7\n$t7',
                                style: TextStyle(fontSize: 11.sp,),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.justify,
                                maxLines: 3,
                              ),
                            ),
                            Container(
                              width: 45.w,
                              child: Text(
                                '8\n$t8',
                                style: TextStyle(fontSize: 11.sp,),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.justify,
                                maxLines: 3,
                              ),
                            ),
                            Container(
                              width: 45.w,
                              child: Text(
                                '9\n$t9',
                                style: TextStyle(fontSize: 11.sp,),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.justify,
                                maxLines: 3,
                              ),
                            ),
                            Container(
                              width: 45.w,
                              child: Text(
                                '10\n$t10',
                                style: TextStyle(fontSize: 11.sp,),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.justify,
                                maxLines: 3,
                              ),
                            ),
                            Container(
                              width: 45.w,
                              child: Text(
                                '11\n$t11',
                                style: TextStyle(fontSize: 11.sp,),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.justify,
                                maxLines: 3,
                              ),
                            ),
                            Container(
                              width: 45.w,
                              child: Text(
                                '12\n$t12',
                                style: TextStyle(fontSize: 11.sp,),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.justify,
                                maxLines: 3,
                              ),
                            ),
                            Container(
                              width: 45.w,
                              child: Text(
                                '13\n$t13',
                                style: TextStyle(fontSize: 11.sp,),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            Container(
                              width: 45.w,
                              child: Text(
                                '14\n$t14',
                                style: TextStyle(fontSize: 11.sp,),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            Container(
                              width: 45.w,
                              child: Text(
                                '15\n$t15',
                                style: TextStyle(fontSize: 11.sp,),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            Container(
                              width: 45.w,
                              child: Text(
                                '16\n$t16',
                                style: TextStyle(fontSize: 11.sp,),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            Container(
                              width: 45.w,
                              child: Text(
                                '17\n$t17',
                                style: TextStyle(fontSize: 11.sp,),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            Container(
                              width: 45.w,
                              child: Text(
                                '18\n$t18',
                                style: TextStyle(fontSize: 11.sp,),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            Container(
                              width: 45.w,
                              child: Text(
                                '19\n$t19',
                                style: TextStyle(fontSize: 11.sp,),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            Container(
                              width: 45.w,
                              child: Text(
                                '20\n$t20',
                                style: TextStyle(fontSize: 11.sp,),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            Container(
                              width: 45.w,
                              child: Text(
                                '21\n$t21',
                                style: TextStyle(fontSize: 11.sp,),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            Container(
                              width: 45.w,
                              child: Text(
                                '22\n$t22',
                                style: TextStyle(fontSize: 11.sp,),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            Container(
                              width: 45.w,
                              child: Text(
                                '23\n$t23',
                                style: TextStyle(fontSize: 11.sp,),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            Container(
                              width: 45.w,
                              child: Text(
                                '24\n$t24',
                                style: TextStyle(fontSize: 11.sp,),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            Container(
                              width: 45.w,
                              child: Text(
                                '25\n$t25',
                                style: TextStyle(fontSize: 11.sp,),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            Container(
                              width: 45.w,
                              child: Text(
                                '26\n$t26',
                                style: TextStyle(fontSize: 11.sp,),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            Container(
                              width: 45.w,
                              child: Text(
                                '27\n$t27',
                                style: TextStyle(fontSize: 11.sp,),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            Container(
                              width: 45.w,
                              child: Text(
                                '28\n$t28',
                                style: TextStyle(fontSize: 11.sp,),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            Container(
                              width: 45.w,
                              child: Text(
                                '29\n$t29',
                                style: TextStyle(fontSize: 11.sp,),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                            Container(
                              width: 45.w,
                              child: Text(
                                '30\n$t30',
                                style: TextStyle(fontSize: 11.sp,),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('images/Cal.png'),
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        offset: const Offset(0, 20.0),
                        blurRadius: 30.0,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
