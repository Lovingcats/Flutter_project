import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/model/time_weather.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
import 'package:weather/widget/time_weather_widget.dart';
import 'package:intl/intl.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key, this.parseWeatherData}) : super(key: key);
  final dynamic parseWeatherData;
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  late String cityName;
  late int temp;
  late String description;
  var weatherIcon;

  bool pressed1 = false;
  bool pressed2 = true;
  bool pressed3 = false;
  int textSize1 = 18;
  int textSize2 = 24;
  int textSize3 = 18;

  int leftPadding = 155;
  int boxSize = 85;
  int pageIndex = 2;

  var yesterdayOpacity = 0.0;
  var todayOpacity = 1.0;
  var tomorrowOpacity = 0.0;

  List<TimeWeather> yesterdayWeather = <TimeWeather>[];
  List<TimeWeather> todayWeather = <TimeWeather>[];
  List<TimeWeather> tomorrowWeather = <TimeWeather>[];

  List<Widget> weatherInformaitons = [];

  var now = DateTime.now();
  late String formatDate1 = DateFormat('MMMM, dd').format(now);
  late String formatDate2 = DateFormat(' MMM').format(now);

  var unixTimestampData = DateTime.now().millisecondsSinceEpoch;
  late String unixTimeStamp = unixTimestampData.toString();

  @override
  void initState() {
    super.initState();

    yesterdayWeather.add(TimeWeather("10:00", "24°"));
    yesterdayWeather.add(TimeWeather("12:00", "25°"));
    yesterdayWeather.add(TimeWeather("14:00", "26°"));
    yesterdayWeather.add(TimeWeather("16:00", "27°"));
    yesterdayWeather.add(TimeWeather("18:00", "28°"));

    todayWeather.add(TimeWeather("10:00", "16°"));
    todayWeather.add(TimeWeather("12:00", "17°"));
    todayWeather.add(TimeWeather("14:00", "18°"));
    todayWeather.add(TimeWeather("16:00", "19°"));
    todayWeather.add(TimeWeather("18:00", "20°"));

    tomorrowWeather.add(TimeWeather("10:00", "12°"));
    tomorrowWeather.add(TimeWeather("12:00", "13°"));
    tomorrowWeather.add(TimeWeather("14:00", "14°"));
    tomorrowWeather.add(TimeWeather("16:00", "15°"));
    tomorrowWeather.add(TimeWeather("18:00", "16°"));

    weatherInformaitons.add(TimeWeaterWidget(timeweather: yesterdayWeather));
    weatherInformaitons.add(TimeWeaterWidget(timeweather: todayWeather));
    weatherInformaitons.add(TimeWeaterWidget(timeweather: tomorrowWeather));

    print(unixTimeStamp);
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    double temp2 = weatherData['main']['temp'];
    temp = temp2.toInt();
    cityName = weatherData['name'];
    description = weatherData['weather'][0]['description'];
  }

  void iconSelet(dynamic weatherData) {
    if (weatherData['weather'][0]['description'] == "clear sky") {}
    else if(weatherData['weather'][0]['description'] == "clear sky"){}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xffE5AB79), Color(0xffC65072)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                )),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 30.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [],
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              Text(
                "${formatDate1}nd${formatDate2}",
                style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                cityName,
                style: TextStyle(
                    fontSize: 40.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                description,
                style: TextStyle(
                    fontSize: 23.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 50.h,
              ),
              Icon(
                LineIcons.cloudWithSun,
                color: Colors.white,
                size: 130.h,
              ),
              Text(
                "22°",
                style: TextStyle(
                    fontSize: 45.h,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            pressed1 = true;
                            pressed2 = false;
                            pressed3 = false;
                            textSize1 = 24;
                            textSize2 = 18;
                            textSize3 = 18;
                            leftPadding = 35;
                            boxSize = 136;
                            yesterdayOpacity = 1.0;
                            todayOpacity = 0.0;
                            tomorrowOpacity = 0.0;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          elevation: 0.0,
                        ),
                        child: Opacity(
                          opacity: pressed1 ? 1.0 : 0.3,
                          child: Text(
                            "Yesterday",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: textSize1.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            pressed2 = true;
                            pressed1 = false;
                            pressed3 = false;
                            textSize2 = 24;
                            textSize1 = 18;
                            textSize3 = 18;
                            leftPadding = 152;
                            boxSize = 95;
                            yesterdayOpacity = 0.0;
                            todayOpacity = 1.0;
                            tomorrowOpacity = 0.0;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          elevation: 0.0,
                        ),
                        child: Opacity(
                          opacity: pressed2 ? 1.0 : 0.3,
                          child: Text(
                            "Today",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: textSize2.sp,
                                fontWeight: FontWeight.w300),
                          ),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            pressed3 = true;
                            pressed1 = false;
                            pressed2 = false;
                            textSize1 = 18;
                            textSize2 = 18;
                            textSize3 = 24;
                            leftPadding = 226;
                            boxSize = 138;

                            yesterdayOpacity = 0.0;
                            todayOpacity = 0.0;
                            tomorrowOpacity = 1.0;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          elevation: 0.0,
                        ),
                        child: Opacity(
                          opacity: pressed3 ? 1.0 : 0.3,
                          child: Text(
                            "Tomorrow",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: textSize3.sp,
                                fontWeight: FontWeight.w300),
                          ),
                        )),
                  ],
                ),
              ),

              //yesterday Padding -> left: 35.w, size -> 116.w
              //today Padding -> left: 155.w, size -> 85.w,
              //tomorrow Padding -> left: 243.w, size -> 122.w
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AnimatedPadding(
                    duration: const Duration(microseconds: 100000),
                    padding: EdgeInsets.only(left: leftPadding.w),
                    child: Container(
                      width: boxSize.w,
                      height: 1.h,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Stack(
                children: [
                  AnimatedOpacity(
                    opacity: yesterdayOpacity,
                    duration: const Duration(microseconds: 1000000),
                    child: weatherInformaitons[0],
                  ),
                  AnimatedOpacity(
                    opacity: todayOpacity,
                    duration: const Duration(microseconds: 1000000),
                    child: weatherInformaitons[1],
                  ),
                  AnimatedOpacity(
                    opacity: tomorrowOpacity,
                    duration: const Duration(microseconds: 1000000),
                    child: weatherInformaitons[2],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
