import 'package:dicegame/dice.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "dice",
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController dice = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        ),
        body: Builder(builder: (context) {
          return GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 50)),
                  const Center(
                    child: Image(
                        image: AssetImage('images/profile.jpg'),
                        width: 170,
                        height: 150),
                  ),
                  Form(
                    child: Theme(
                      data: ThemeData(
                          primaryColor: Colors.teal,
                          inputDecorationTheme: const InputDecorationTheme(
                              labelStyle: TextStyle(
                            color: Colors.teal,
                            fontSize: 15,
                          ))),
                      child: Container(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          children: [
                            TextField(
                              controller: dice,
                              decoration:
                                  const InputDecoration(labelText: 'Enter "dice"'),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextField(
                              controller: password,
                              decoration:
                                  const InputDecoration(labelText: 'Enter password'),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ButtonTheme(
                                minWidth: 150,
                                height: 75,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (dice.text == "dice" &&
                                        password.text == "1234") {
                                      LoginSucces();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const DicePage()),
                                      );
                                    } else {
                                      LoginError();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.orangeAccent,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}

void LoginError() {
  Fluttertoast.showToast(
      msg: "로그인 정보를 다시 확인해주세요",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

void LoginSucces() {
  Fluttertoast.showToast(
      msg: "로그인 성공!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0);
}
