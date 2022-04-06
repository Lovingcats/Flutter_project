import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftdice = 1;
  int rightdice = 1;
  int adddice = 1;
  int count = -1;
  bool isstart = false;
  bool finishpress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.redAccent,
          title: const Text("DiceGame"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isstart)
                Text('목표 합 : $adddice',
                    style:
                        const TextStyle(fontSize: 25, color: Colors.blueAccent))
              else
                SizedBox(),
              if (isstart)
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Row(
                    children: [
                      Expanded(
                        child: Image(
                          image: AssetImage('images/dice$leftdice.png'),
                          width: 300,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Image(
                          image: AssetImage('images/dice$rightdice.png'),
                          width: 300,
                        ),
                      ),
                    ],
                  ),
                ),
              if (!isstart)
                const Text(
                  "시작버튼을 눌러주세요",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              const SizedBox(
                height: 30,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (!isstart) {
                        adddice = Random().nextInt(12) + 2;
                      }
                      isstart = true;
                      leftdice = Random().nextInt(6) + 1;
                      rightdice = Random().nextInt(6) + 1;
                      count++;
                      if (adddice == (leftdice + rightdice)) {
                        correct('$count 번 시도해서 성공하셨습니다!');
                        count = -1;
                        isstart = false;
                      }
                    });
                  },
                  child: Icon(isstart ? Icons.change_circle : Icons.play_arrow),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(75, 50),
                      primary: Colors.orangeAccent),
                ),
                const SizedBox(
                  width: 20,
                ),
                if (isstart)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isstart = false;
                        restart();
                      });
                    },
                    child: const Icon(Icons.stop),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(75, 50),
                        primary: Colors.orangeAccent),
                  ),
              ])
            ],
          ),
        ));
  }
}

void restart() {
  Fluttertoast.showToast(
      msg: "게임을 다시 시작합니다",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.redAccent,
      fontSize: 16.0);
}

void correct(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0);
}
