import 'package:flutter/material.dart';
import 'package:weather/model/time_weather.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeWeaterWidget extends StatefulWidget {
  final List<TimeWeather> timeweather;
  const TimeWeaterWidget({Key? key, required this.timeweather})
      : super(key: key);

  @override
  State<TimeWeaterWidget> createState() => _TimeWeaterWidgetState();
}

class _TimeWeaterWidgetState extends State<TimeWeaterWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 50.w, right: 50.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: makeTimeWeather(context, widget.timeweather),
      ),
    );
  }
}

List<Widget> makeTimeWeather(
    BuildContext context, List<TimeWeather> timeweathers) {
  List<Widget> results = [];
  for (var i = 0; i < timeweathers.length; i++) {
    results.add(Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          timeweathers[i].time,
          style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white),
        ),
        SizedBox(
          height: 10.h,
        ),
        Icon(
          Icons.wb_sunny_outlined,
          color: Colors.white,
          size: 35.h,
        ),
        SizedBox(
          height: 6.h,
        ),
        Text(
          timeweathers[i].temp,
          style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white),
        ),
      ],
    ));
  }
  return results;
}
