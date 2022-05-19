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

  void _emailClearTextField() {
    _emailController.clear();
    setState(() {});
  }

  void _email1ClearTextField() {
    _email1Controller.clear();
    setState(() {});
  }

  final _idController = TextEditingController();
  final _pwdController = TextEditingController();
  final _pwd1Controller = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _email1Controller = TextEditingController();

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

                      //아이디
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(
                            width: 18,
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
                          SizedBox(
                            width: 210,
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
                                      fontSize: 12,
                                      fontFamily: "GrandStander",
                                      color: Color(0xffC4D3CC),
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 65,
                            height: 23,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  primary: const Color(0xffFFEE95)),
                              child: const Text(
                                "중복확인",
                                style: TextStyle(
                                    fontSize: 11.5, color: Color(0xff555B6E)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //아이디 끝
                      const SizedBox(
                        height: 10,
                      ),
                      //비밀번호
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(
                            width: 18,
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
                          SizedBox(
                            width: 280,
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
                                          icon: const Icon(Icons.clear),
                                          onPressed: _pwdClearTextField,
                                        ),
                                  hintText: ' 비밀번호(숫자,영문, 특수문자 조합 최소 8자)',
                                  hintStyle: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: "GrandStander",
                                      color: Color(0xffC4D3CC),
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                      //비밀번호 끝
                      const SizedBox(
                        height: 10,
                      ),
                      //비밀번호 확인
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(
                            width: 18,
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
                          SizedBox(
                            width: 280,
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
                                          icon: const Icon(Icons.clear),
                                          onPressed: _pwd1ClearTextField,
                                        ),
                                  hintText: ' 비밀번호(숫자,영문, 특수문자 조합 최소 8자)',
                                  hintStyle: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: "GrandStander",
                                      color: Color(0xffC4D3CC),
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                      //비밀번호 확인 끝
                      const SizedBox(
                        height: 10,
                      ),
                      //이름 (닉네임)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(
                            width: 18,
                          ),
                          Text(
                            "이름 (닉네임)",
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
                          SizedBox(
                            width: 210,
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
                                          icon: const Icon(Icons.clear),
                                          onPressed: _nameClearTextField,
                                        ),
                                  hintText: ' 이름(닉네임) 입력',
                                  hintStyle: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: "GrandStander",
                                      color: Color(0xffC4D3CC),
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 65,
                            height: 23,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  primary: const Color(0xffFFEE95)),
                              child: const Text(
                                "중복확인",
                                style: TextStyle(
                                    fontSize: 11.5, color: Color(0xff555B6E)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //이름 (닉네임) 끝
                      const SizedBox(
                        height: 10,
                      ),

                      //이메일
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(
                            width: 18,
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
                          SizedBox(
                            width: 210,
                            height: 23,
                            child: TextField(
                              maxLines: 1,
                              minLines: 1,
                              controller: _emailController,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 3),
                                  border: const OutlineInputBorder(),
                                  suffixIcon: _emailController.text.isEmpty
                                      ? null // Show nothing if the text field is empty
                                      : IconButton(
                                          padding: EdgeInsets.only(left: 40),
                                          icon: const Icon(Icons.clear),
                                          onPressed: _emailClearTextField,
                                        ),
                                  hintText: ' 이메일 입력',
                                  hintStyle: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: "GrandStander",
                                      color: Color(0xffC4D3CC),
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 65,
                            height: 23,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  primary: const Color(0xffFFEE95)),
                              child: const Text(
                                "인증받기",
                                style: TextStyle(
                                    fontSize: 11.5, color: Color(0xff555B6E)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //이메일 끝
                      const SizedBox(
                        height: 10,
                      ),
                      //인증번호
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(
                            width: 18,
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
                          SizedBox(
                            width: 210,
                            height: 23,
                            child: TextField(
                              maxLines: 1,
                              minLines: 1,
                              controller: _email1Controller,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 3),
                                  border: const OutlineInputBorder(),
                                  suffixIcon: _email1Controller.text.isEmpty
                                      ? null // Show nothing if the text field is empty
                                      : IconButton(
                                          padding: EdgeInsets.only(left: 40),
                                          icon: const Icon(Icons.clear),
                                          onPressed: _email1ClearTextField,
                                        ),
                                  hintText: ' 이메일 인증번호 인증',
                                  hintStyle: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: "GrandStander",
                                      color: Color(0xffC4D3CC),
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 65,
                            height: 23,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  primary: const Color(0xffFFEE95)),
                              child: const Text(
                                "확인",
                                style: TextStyle(
                                    fontSize: 11.5, color: Color(0xff555B6E)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //이름 (닉네임) 끝
                      const SizedBox(
                        height: 70,
                      ),

                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("가입하기",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xffFAF9F9),
                            )),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xffB3E2DC),
                          minimumSize: const Size(175, 47),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
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
              const Positioned(
                top: 620,
                left: 53,
                child: Text(
                  "welbato choigo jjangjjangman wooju daebag michin app",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xffC4C4C4),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
