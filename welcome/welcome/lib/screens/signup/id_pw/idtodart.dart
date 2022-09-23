import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welcome/common/common.dart';
import 'package:welcome/screens/signup/id_pw/pageview/findid.dart';

class IdToEmail extends StatefulWidget {
  const IdToEmail({Key? key}) : super(key: key);

  @override
  State<IdToEmail> createState() => _IdToEmailState();
}

//207
class _IdToEmailState extends State<IdToEmail> {
  
  int currentindex = 0;
  late PageController _controller;
  bool ispressed1 = true;
  bool ispressed2 = false;
  bool ispressed3 = true;
  bool ispressed4 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: currentindex);
  }

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
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (_) => const Status()));
                },
                child: Text("다음", style: TextStyle(fontSize: 24.sp)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: CommonColor.blue,
                    minimumSize: Size(414.w, 59.h)),
              )),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "아이디/비번찾기",
            style: TextStyle(
                fontSize: 23.sp,
                color: Colors.black,
                fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: const Icon(null),
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 55.w, right: 55.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          ispressed1 = true;
                          ispressed2 = false;
                          currentindex = 0;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent, elevation: 0),
                      child: Text(
                        "아이디",
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: ispressed1
                                ? CommonColor.blue
                                : CommonColor.gray,
                            fontWeight: FontWeight.w600),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          ispressed1 = false;
                          ispressed2 = true;
                          currentindex = 1;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent, elevation: 0),
                      child: Text(
                        "비밀번호",
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: ispressed2
                                ? CommonColor.blue
                                : CommonColor.gray,
                            fontWeight: FontWeight.w600),
                      )),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 207.w,
                  height: 2.h,
                  decoration: BoxDecoration(
                      color: ispressed1 ? CommonColor.blue : CommonColor.gray),
                ),
                Container(
                  width: 207.w,
                  height: 2.h,
                  decoration: BoxDecoration(
                      color: ispressed2 ? CommonColor.blue : CommonColor.gray),
                ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                children: [
                    

                    //111111111111111111111111111111111111111111111111111111111

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  gotoSelectedPage(int selectedPage) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FindId(selectedPage),
      ),
    );
  }
}
