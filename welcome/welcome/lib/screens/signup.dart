import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome',
      home: const SignUp(),
      theme: ThemeData(),
    );
  }
}

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(color: Color(0xffFAF9F9)),
              ),
              Container(
                height: 380,
                width: double.infinity,
                decoration: const BoxDecoration(color: Color(0xffBEE3DB)),
              ),
              const Positioned(
                child: Padding(
                  padding: EdgeInsets.all(25),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "wELBATO",
                      style: TextStyle(
                          fontSize: 43,
                          color: Color(0xffFAF9F9),
                          fontFamily: "Gaegu",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 100, 50, 100),
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "회원가입",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Grandstander",
                            color: Color(0xff89B0AE)),
                      ),
                      const Text(
                        "아래 정보를 입력하세요.",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Grandstander",
                            color: Color(0xff89B0AE)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(
                            width: 28,
                          ),
                          Text(
                            "아이디",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 11,
                                fontFamily: "GrandStander",
                                color: Color(0xff555B6E)),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: null,
                            shape: BoxShape.rectangle,
                            border: Border.all(
                                color: Color(0xffC4D3CC), width: 1.0)),
                        width: 260,
                        height: 25,
                        child: TextField(
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                              hintText: '아이디 입력(5~10글자)',
                              hintStyle: TextStyle(
                                  fontSize: 10,
                                  fontFamily: "GrandStander",
                                  color: Color(0xffC4D3CC),
                                  fontWeight: FontWeight.bold)),
                        ),
                      )
                    ],
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xffFAF9F9),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
