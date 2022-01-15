import 'package:flutter/material.dart';

class Notice extends StatefulWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NoticePage(),
    );
  }
}

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("notice", style: TextStyle(fontSize: 19)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: const [
            SizedBox(height: 30),
            Text("noticepage",
                style: TextStyle(fontSize: 30, color: Colors.black))
          ],
        ),
      ),
    );
  }
}
