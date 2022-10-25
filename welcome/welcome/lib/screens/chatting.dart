import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'x',
      home: Chatting(),
    );
  }
}

class Chatting extends StatelessWidget {
  const Chatting({Key? key}) : super(key: key);

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
              hintStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                height: 2.8,
                color: Colors.grey,
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        )),
        appBar: AppBar(
          toolbarHeight: 100,
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
            height: 100,
            width: 100,
            margin: const EdgeInsets.fromLTRB(20, 20, 0, 20),
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
          leadingWidth: 100,
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              height: 499,
              color: Colors.lightBlue,
              child: Column(
                verticalDirection: VerticalDirection.down,
                children: [
                  Container(
                    height: 50,
                    width: 120,
                    margin: const EdgeInsets.only(left: 280),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 260),
                    height: 50,
                    width: 120,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
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
