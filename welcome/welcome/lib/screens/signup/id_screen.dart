import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welcome/common/common.dart';
import 'package:welcome/screens/signup/pw_screen.dart';

class ID extends StatefulWidget {
  const ID({Key? key}) : super(key: key);

  @override
  State<ID> createState() => _IDState();
}

class _IDState extends State<ID> {
  final _idController = TextEditingController();
  String id = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
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
                    id = _idController.text;
                  });

                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const PW()));
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
                    top: 25.h, left: 22.w, bottom: 27.h, right: 131.w),
                child: Text(
                  "사용할 아이디를 입력해주세요",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 28.w, right: 28.w),
                child: TextField(
                  controller: _idController,
                  decoration: InputDecoration(
                    labelText: 'ID',
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
