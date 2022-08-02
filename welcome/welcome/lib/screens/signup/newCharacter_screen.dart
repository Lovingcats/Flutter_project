import 'package:flutter/material.dart';
import 'package:welcome/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welcome/main.dart';
import 'package:welcome/model/character.dart';
import 'package:welcome/screens/signup/login.dart';
import 'package:welcome/widget/showCharacter.dart';

class NewCharacter extends StatefulWidget {
  const NewCharacter({Key? key}) : super(key: key);

  @override
  State<NewCharacter> createState() => _NewCharacterState();
}

class _NewCharacterState extends State<NewCharacter> {
  final _nicknameController = TextEditingController();
  String nickname = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: CommonColor.blue,
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 11.w, top: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const Welcome()));
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 22.h,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 19.h),
                child: Icon(
                  Icons.circle,
                  size: 187.h,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 142.w, right: 142.w),
                child: TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 24.sp),
                  controller: _nicknameController,
                  decoration: InputDecoration(
                    hintText: "닉네임 입력",
                    hintStyle: TextStyle(fontSize: 24.sp, color: Colors.white),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    focusedErrorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 5),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              const showCharacter()
            ],
          ),
        ),
      ),
    );
  }
}
