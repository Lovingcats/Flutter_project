import 'package:flutter/material.dart';
import 'package:welcome/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindId extends StatefulWidget {
  final initialPage;
  const FindId({Key? key, this.initialPage}) : super(key: key);

  @override
  State<FindId> createState() => _FindIdState();
}

class _FindIdState extends State<FindId> {
  late PageController _pageController;

  final emailController = TextEditingController();
  final confirmController = TextEditingController();
  final emailController1 = TextEditingController();
  final confirmController1 = TextEditingController();
  final idController = TextEditingController();

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.initialPage);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30.w),
                child: SizedBox(
                  width: 240.w,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: '이메일',
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: CommonColor.blue, width: 1),
                      ),
                      focusedErrorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 5),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.w, top: 20.h),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1.0, color: CommonColor.blue),
                          borderRadius: BorderRadius.circular(20.h)),
                    ),
                    child: Text(
                      "인증번호 전송",
                      style:
                          TextStyle(fontSize: 15.sp, color: CommonColor.blue),
                    )),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30.w),
                child: SizedBox(
                  width: 240.w,
                  child: TextField(
                    controller: confirmController,
                    decoration: InputDecoration(
                      labelText: '인증번호 확인',
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: CommonColor.blue, width: 1),
                      ),
                      focusedErrorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 5),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.w, top: 20.h),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      minimumSize: Size(120.w, 37.h),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1.0, color: CommonColor.blue),
                          borderRadius: BorderRadius.circular(20.h)),
                    ),
                    child: Text(
                      "확인",
                      style:
                          TextStyle(fontSize: 15.sp, color: CommonColor.blue),
                    )),
              )
            ],
          ),
        ],
      ),
      //11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111

      Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            child: TextField(
              controller: idController,
              decoration: InputDecoration(
                labelText: '아이디 입력',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30.w),
                child: SizedBox(
                  width: double.infinity,
                  child: TextField(
                    controller: emailController1,
                    decoration: InputDecoration(
                      labelText: '이메일',
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: CommonColor.blue, width: 1),
                      ),
                      focusedErrorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 5),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.w, top: 20.h),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1.0, color: CommonColor.blue),
                          borderRadius: BorderRadius.circular(20.h)),
                    ),
                    child: Text(
                      "인증번호 전송",
                      style:
                          TextStyle(fontSize: 15.sp, color: CommonColor.blue),
                    )),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30.w),
                child: SizedBox(
                  width: 240.w,
                  child: TextField(
                    controller: confirmController1,
                    decoration: InputDecoration(
                      labelText: '인증번호 확인',
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: CommonColor.blue, width: 1),
                      ),
                      focusedErrorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 5),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.w, top: 20.h),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      minimumSize: Size(120.w, 37.h),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1.0, color: CommonColor.blue),
                          borderRadius: BorderRadius.circular(20.h)),
                    ),
                    child: Text(
                      "확인",
                      style:
                          TextStyle(fontSize: 15.sp, color: CommonColor.blue),
                    )),
              )
            ],
          ),
        ],
      )
    ];
    return PageView.builder(
      controller: _pageController,
      itemCount: pages.length,
      itemBuilder: (context, index) {
        return Center(
          child: pages[index],
        );
      },
    );
  }
}
