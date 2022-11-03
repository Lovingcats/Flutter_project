import 'package:flutter/material.dart';
import 'package:welcome/model/message.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welcome/screens/inchat.dart';

class Chatting extends StatefulWidget {
  const Chatting({Key? key}) : super(key: key);

  @override
  State<Chatting> createState() => _ChattingState();
}

class _ChattingState extends State<Chatting> {
  List<Message> messages = <Message>[];
  @override
  void initState() {
    super.initState();

    messages.add(Message(
      "바늘이",
      "아 그런게 좋은거 같아요.",
    ));

    messages.add(Message(
      "바늘이",
      "아 그런게 좋은거 같아요.",
    ));
    messages.add(Message(
      "바늘이",
      "아 그런게 좋은거 같아요.",
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const InChat()));
              },
              leading: Icon(
                Icons.circle,
                size: 63.h,
              ),
              title: Text(
                messages[index].name,
                style: TextStyle(
                    fontSize: 17.sp,
                    fontFamily: "Grandstander",
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Text(
                  messages[index].message,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: "Grandstander",
                  ),
                ),
              ),

              //dense: true,
            ),
          );
        },
      ),
    );
  }
}
