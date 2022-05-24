import 'package:flutter/material.dart';
import 'package:welcome/screens/picture.dart';
import 'package:welcome/screens/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome',
      home: const Welcome(),
      theme: ThemeData(),
    );
  }
}

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF9EC3FF),
        appBar: null,
        body: Builder(builder: (context) {
          return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      const Icon(
                        Icons.circle,
                        size: 150,
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        "WElBATO",
                        style: TextStyle(
                          fontSize: 48,
                          fontFamily: "Grandstander",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 35),
                      Container(
                        width: 300,
                        height: 182,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.fromLTRB(40, 15, 40, 30),
                              child: Padding(
                                padding: EdgeInsets.zero,
                                child: TextField(
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff9EC3FF)),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff9EC3FF)),
                                      ),
                                      hintText: '아이디',
                                      hintStyle:
                                          TextStyle(color: Color(0xff9EC3FF))),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(40, 0, 40, 30),
                              child: Padding(
                                padding: EdgeInsets.zero,
                                child: TextField(
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff9EC3FF)),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff9EC3FF)),
                                      ),
                                      hintText: '비밀번호',
                                      hintStyle:
                                          TextStyle(color: Color(0xff9EC3FF))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 13),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const Picture()));
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              primary: Colors.white,
                              minimumSize: const Size(194, 30),
                            ),
                            child: const Text(
                              "로그인",
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xFF9EC3FF)),
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(0.0),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const SignUp()));
                                },
                                child: const Text(
                                  "회원가입",
                                  style: TextStyle(
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 3),
                                )),
                          ),
                          Container(
                            padding: EdgeInsets.all(0.0),
                            child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "비밀번호를 잊어버리셨나요?",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ));
        }));
  }
}
