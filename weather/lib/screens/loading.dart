import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/data/my_location.dart';
import 'package:weather/screens/weather_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';

const apiKey = '0d0cc1131b44cd6ea0027e60e69dc007';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late double latitude1 = 0.0;
  late double longitude1 = 0.0;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getMyCurrentLocation() async {
    try {
      Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position.latitude);
      print(position.longitude);
      latitude1 = position.latitude;
      longitude1 = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  Future postrequest() async {
    try {
      print('실행됨');
      String url = 'http://10.150.149.170:3000/weather';
      print('실행됨1');
      http.Response response = await http.post(Uri.parse(url),
          body: <String, String>{
            "latitude": "${latitude1}",
            "longitude": "${longitude1}"
          });
      print('실행됨2');
      var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
        print(parsingData);
      } else {
        print("오류남");
        //오류 발생 코드
      }
    } catch (e) {
      print(e);
    }
  }

  void getLocation() async {
    await getMyCurrentLocation();
    // ignore: use_build_context_synchronously
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              await postrequest();
            },
            child: Text("눌러")),
        // child: SpinKitWave(color: Colors.yellow)
      ),
    );
  }
}
