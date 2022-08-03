
import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:welcome/main.dart';

void main() {
  runApp(const MyApp1());
}

class MyApp1 extends StatefulWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  State<MyApp1> createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
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
  void _idClearTextField() {
    _idController.clear();
    setState(() {});
  }

  void _pwdClearTextField() {
    _pwdController.clear();
    setState(() {});
  }

  void _pwd1ClearTextField() {
    _pwd1Controller.clear();
    setState(() {});
  }

  void _nameClearTextField() {
    _nameController.clear();
    setState(() {});
  }

  void SignupSucces() {
    Fluttertoast.showToast(
        msg: "회원가입 성공!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  final _idController = TextEditingController();
  final _pwdController = TextEditingController();
  final _pwd1Controller = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _email1Controller = TextEditingController();
  String id = '';
  String pwd = '';
  String pwd1 = '';
  String name = '';
  String email = '';
  String email1 = '';
  late String _status;

  final String _url = "http://10.150.149.119:8888/login/register";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                decoration: const BoxDecoration(color: Color(0xff9EC3FF)),
              ),
              const Positioned(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
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
                padding: const EdgeInsets.fromLTRB(40, 80, 40, 80),
                child: Container(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "회원가입",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Grandstander",
                            color: Color(0xff0C264B)),
                      ),
                      const Text(
                        "아래 정보를 입력하세요.",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Grandstander",
                            color: Color(0xff0C264B)),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //아이디

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(
                            width: 45,
                          ),
                          Text(
                            "아이디",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 11,
                                fontFamily: "GrandStander",
                                color: Color(0xff555B6E)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 3, 15, 10),
                            width: 245,
                            height: 23,
                            child: TextField(
                              maxLines: 1,
                              minLines: 1,
                              controller: _idController,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 3),
                                  border: const OutlineInputBorder(),
                                  suffixIcon: _idController.text.isEmpty
                                      ? null // Show nothing if the text field is empty
                                      : IconButton(
                                          padding: EdgeInsets.only(left: 40),
                                          icon: const Icon(Icons.cancel),
                                          onPressed: _idClearTextField,
                                        ),
                                  hintText: ' 아이디 입력(5~10글자)',
                                  hintStyle: const TextStyle(
                                      fontSize: 10,
                                      fontFamily: "GrandStander",
                                      color: Color(0xffCFCFCF),
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                      //아이디 끝

                      //비밀번호
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(
                            width: 45,
                          ),
                          Text(
                            "비밀번호",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 11,
                                fontFamily: "GrandStander",
                                color: Color(0xff555B6E)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 3, 15, 10),
                            width: 245,
                            height: 23,
                            child: TextField(
                              maxLines: 1,
                              minLines: 1,
                              controller: _pwdController,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 3),
                                  border: const OutlineInputBorder(),
                                  suffixIcon: _pwdController.text.isEmpty
                                      ? null // Show nothing if the text field is empty
                                      : IconButton(
                                          padding: EdgeInsets.only(left: 40),
                                          icon: const Icon(Icons.cancel),
                                          onPressed: _pwdClearTextField,
                                        ),
                                  hintText: ' 비밀번호(숫자,영문,특수문자 조합 최소 8자)',
                                  hintStyle: const TextStyle(
                                      fontSize: 10,
                                      fontFamily: "GrandStander",
                                      color: Color(0xffCFCFCF),
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                      //비밀번호 끝
                      //비밀번호 확인
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(
                            width: 45,
                          ),
                          Text(
                            "비밀번호 다시 입력",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 11,
                                fontFamily: "GrandStander",
                                color: Color(0xff555B6E)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 2, 15, 10),
                            width: 245,
                            height: 23,
                            child: TextField(
                              maxLines: 1,
                              minLines: 1,
                              controller: _pwd1Controller,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 3),
                                  border: const OutlineInputBorder(),
                                  suffixIcon: _pwd1Controller.text.isEmpty
                                      ? null // Show nothing if the text field is empty
                                      : IconButton(
                                          padding: EdgeInsets.only(left: 40),
                                          icon: const Icon(Icons.cancel),
                                          onPressed: _pwd1ClearTextField,
                                        ),
                                  hintText: ' 비밀번호(숫자,영문,특수문자 조합 최소 8자)',
                                  hintStyle: const TextStyle(
                                      fontSize: 10,
                                      fontFamily: "GrandStander",
                                      color: Color(0xffCFCFCF),
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                      //비밀번호 확인 끝
                      //이름 (닉네임)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(
                            width: 45,
                          ),
                          Text(
                            "이름",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 11,
                                fontFamily: "GrandStander",
                                color: Color(0xff555B6E)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 2, 15, 10),
                            width: 245,
                            height: 23,
                            child: TextField(
                              maxLines: 1,
                              minLines: 1,
                              controller: _nameController,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 3),
                                  border: const OutlineInputBorder(),
                                  suffixIcon: _nameController.text.isEmpty
                                      ? null // Show nothing if the text field is empty
                                      : IconButton(
                                          padding: EdgeInsets.only(left: 40),
                                          icon: const Icon(Icons.cancel),
                                          onPressed: _nameClearTextField,
                                        ),
                                  hintText: ' 이름(닉네임) 입력',
                                  hintStyle: const TextStyle(
                                      fontSize: 10,
                                      fontFamily: "GrandStander",
                                      color: Color(0xffCFCFCF),
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                      //이름 (닉네임) 끝

                      //이메일
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(
                            width: 45,
                          ),
                          Text(
                            "이메일",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 11,
                                fontFamily: "GrandStander",
                                color: Color(0xff555B6E)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 2, 15, 10),
                            width: 245,
                            height: 23,
                            child: TextField(
                              maxLines: 1,
                              minLines: 1,
                              controller: _emailController,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 3),
                                  border: const OutlineInputBorder(),
                                  suffixIconConstraints: BoxConstraints(
                                      minHeight: 17,
                                      maxHeight: 17,
                                      maxWidth: 55,
                                      minWidth: 55),
                                  suffixIcon: _emailController.text.isEmpty
                                      ? null // Show nothing if the text field is empty
                                      : ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              primary: const Color(0xffFFEE95)),
                                          child: const Text(
                                            "인증받기",
                                            style: TextStyle(
                                                fontSize: 11.5,
                                                color: Color(0xff555B6E)),
                                          ),
                                        ),
                                  hintText: ' 이메일 입력',
                                  hintStyle: const TextStyle(
                                      fontSize: 10,
                                      fontFamily: "GrandStander",
                                      color: Color(0xffCFCFCF),
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                      //이메일 끝

                      //인증번호
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(
                            width: 45,
                          ),
                          Text(
                            "인증번호",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 11,
                                fontFamily: "GrandStander",
                                color: Color(0xff555B6E)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 2, 15, 10),
                            width: 245,
                            height: 23,
                            child: TextField(
                              maxLines: 1,
                              minLines: 1,
                              controller: _email1Controller,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 3),
                                  border: const OutlineInputBorder(),
                                  suffixIconConstraints: BoxConstraints(
                                      minHeight: 17,
                                      maxHeight: 17,
                                      maxWidth: 55,
                                      minWidth: 55),
                                  suffixIcon: _email1Controller.text.isEmpty
                                      ? null // Show nothing if the text field is empty
                                      : ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              primary: const Color(0xffFFEE95)),
                                          child: const Text(
                                            "확인",
                                            style: TextStyle(
                                                fontSize: 11.5,
                                                color: Color(0xff555B6E)),
                                          ),
                                        ),
                                  hintText: ' 이메일 인증번호 입력',
                                  hintStyle: const TextStyle(
                                      fontSize: 10,
                                      fontFamily: "GrandStander",
                                      color: Color(0xffCFCFCF),
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(
                            width: 45,
                          ),
                          Text(
                            "신분",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 11,
                                fontFamily: "GrandStander",
                                color: Color(0xff555B6E)),
                          ),
                        ],
                      ),
                      //이름 (닉네임) 끝
                      CustomRadioButton(
                        margin: EdgeInsets.fromLTRB(15, 2, 0, 1.1),
                        height: 30,
                        width: 80,
                        elevation: 0,
                        absoluteZeroSpacing: true,
                        unSelectedColor: Theme.of(context).canvasColor,
                        buttonLables: const ['재학생', '졸업생', '학부모', '일반'],
                        buttonValues: const ["재학생", "졸업생", "학부모", "일반"],
                        buttonTextStyle: const ButtonTextStyle(
                            selectedColor: Color(0xff000000),
                            unSelectedColor: Color(0xffBDBDBD),
                            textStyle: TextStyle(fontSize: 14)),
                        radioButtonValue: (value) {
                          setState(() {
                            _status = value as String;
                          });
                        },
                        selectedColor: Color(0xffFFEE95),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                    ],
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffBDBDBD)),
                    color: const Color(0xffFAF9F9),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              Positioned(
                top: 575,
                left: 115,
                child: ElevatedButton(
                  onPressed: () async {
                    // setState(() {
                    //   id = _idController.text;
                    //   pwd = _pwdController.text;
                    //   pwd1 = _pwd1Controller.text;
                    //   name = _nameController.text;
                    //   email = _emailController.text;
                    //   email1 = _email1Controller.text;
                    // });
                    // print(_status);
                    // print("$email");

                    // http.Response response = await http.post(
                    //   Uri.parse(_url),
                    //   headers: <String, String>{
                    //     'Content-Type': 'application/x-www-form-urlencoded',
                    //   },
                    //   body: <String, String>{
                    //     'name': "$name",
                    //     'id': "$id",
                    //     'pwd': "$pwd",
                    //     'email': "$email",
                    //     'status': "$_status",
                    //     'grade': "2021"
                    //   },
                    // );
                    // SignupSucces();
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (_) => const Welcome()));
                  },
                  child: const Text("다음",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xffFAF9F9),
                      )),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff9EC3FF),
                    minimumSize: const Size(175, 47),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
