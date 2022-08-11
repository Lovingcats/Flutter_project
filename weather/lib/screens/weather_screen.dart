import 'package:flutter/material.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key, this.parseWeatherData}) : super(key: key);
  final dynamic parseWeatherData;
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  late String cityName;
  late int temp;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    double temp2 = weatherData['main']['temp'];
    temp = temp2.toInt();
    cityName = weatherData['name'];
    print(cityName);
    print(temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              cityName,
              style: const TextStyle(fontSize: 30.0),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              '$temp',
              style: const TextStyle(fontSize: 30.0),
            )
          ],
        ),
      )),
    );
  }
}
