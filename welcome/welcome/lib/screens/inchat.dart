import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);


class InChat extends StatefulWidget {
  const InChat({Key? key}) : super(key: key);

  @override
  State<InChat> createState() => _InChatState();
}

class _InChatState extends State<InChat> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        bottomSheet: SafeArea(
            child: Container(
          height: 60.2,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[100],
              suffixIconConstraints: const BoxConstraints(
                maxHeight: 40,
                maxWidth: 40,
              ),
              suffixIcon: Container(
                margin: EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    color: Colors.grey, shape: BoxShape.circle
                    // borderRadius: BorderRadius.circular(500)
                    ),
                alignment: Alignment.center,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  color: Colors.white,
                  icon: const Icon(Icons.arrow_upward),
                ),
              ),
              hintText: '여기를 터치해서 메시지를 보내세요',
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                height: 2.8.h,
                color: Colors.grey,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(100.r)),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        )),
        appBar: AppBar(
          toolbarHeight: 100.h,
          backgroundColor: Colors.lightBlue,
          elevation: 0,
          title: const Text(
            '바늘이',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Container(
            height: 100.h,
            width: 100.w,
            margin: EdgeInsets.fromLTRB(20.w, 20.h, 0.w, 20.h),
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
          leadingWidth: 100.w,
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              height: 499.h,
              color: Colors.lightBlue,
              child: Column(
                verticalDirection: VerticalDirection.down,
                children: [
                  Container(
                    height: 50.h,
                    width: 120.w,
                    margin: EdgeInsets.only(left: 280.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r),
                            bottomLeft: Radius.circular(10.r))),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 260.w),
                    height: 50.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r),
                            bottomRight: Radius.circular(10.r))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
