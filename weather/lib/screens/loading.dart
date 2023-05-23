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
  bool isloading = true;

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
      latitude1 = position.latitude;
      longitude1 = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  Future postrequest() async {
    try {
      String url = 'http://10.150.149.170:3000/weather';
      http.Response response = await http.post(Uri.parse(url),
          body: <String, String>{
            "latitude": "$latitude1",
            "longitude": "$longitude1"
          });
      // ignore: unused_local_variable
      var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200) {
        // ignore: unused_local_variable
        var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
        // ignore: avoid_print
        print(parsingData);
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const Weather()));
        setState(() {
          isloading = false;
        });
      } else {
        // ignore: avoid_print
        print("오류남");
        //오류 발생 코드
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void getLocation() async {
    await getMyCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloading
          ? const Center(child: SpinKitWave(color: Color(0xffD57E76)))
          : const Center(),
    );
  }
}
