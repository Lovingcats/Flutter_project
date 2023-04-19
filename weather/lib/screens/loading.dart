import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/data/my_location.dart';
import 'package:weather/screens/weather_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '0d0cc1131b44cd6ea0027e60e69dc007';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late double latitude3 = 0.0;
  late double longitude3 = 0.0;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void postrequest() async {
    try {
      String url = 'http://10.0.2.2:3000/weather';
      http.Response response = await http.post(Uri.parse(url),
          body: <String, String>{
            "latitude": "${latitude3}",
            "longitude": "${longitude3}"
          });
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
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);
    // ignore: use_build_context_synchronously
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {}, child: Text("눌러")),
        // child: SpinKitWave(color: Colors.yellow)
      ),
    );
  }
}
