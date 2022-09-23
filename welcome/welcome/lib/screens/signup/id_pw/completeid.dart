import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
class CompleteId extends StatefulWidget {
  const CompleteId({Key? key}) : super(key: key);

  @override
  State<CompleteId> createState() => _CompleteIdState();
}

class _CompleteIdState extends State<CompleteId> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("아이디 찾기가 완료되었습니다!", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }
}
