import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:welcome/common/common.dart';
import 'package:welcome/provider/signupproivder.dart';
import 'package:welcome/screens/signup/name_screen.dart';

class PW extends StatefulWidget {
  const PW({Key? key}) : super(key: key);

  @override
  State<PW> createState() => _PWState();
}

class _PWState extends State<PW> {
  final _pwdController = TextEditingController(); // Textfield를 위한 컨트롤러
  String pwd = '';

  @override
  Widget build(BuildContext context) {
    var signupData = Provider.of<SignupData>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // 화면을 클릭하면 키보드 내려감
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomSheet: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    pwd = _pwdController.text;
                    signupData.inputPw(pwd);
                    print(pwd);
                  });
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const Name()));
                },
                child: Text("다음", style: TextStyle(fontSize: 24.sp)),
                style: ElevatedButton.styleFrom(
                    primary: CommonColor.blue, minimumSize: Size(414.w, 59.h)),
              )),
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 12.h, left: 11.w),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 22.h,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 25.h, left: 20.w, bottom: 27.h, right: 112.w),
                child: Text(
                  "사용할 비밀번호를 입력해주세요",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 28.w, right: 28.w),
                child: TextField(
                  controller: _pwdController,
                  decoration: InputDecoration(
                    labelText: 'PW',
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: CommonColor.blue, width: 1),
                    ),
                    focusedErrorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 5),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 490.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
