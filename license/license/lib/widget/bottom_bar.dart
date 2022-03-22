import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 60,
        child: const TabBar(
          tabs: [
            Tab(
                icon: Icon(
                  Icons.home,
                  size: 18,
                  color: Colors.black,
                ),
                child: Text(
                  "홈",
                  style: TextStyle(
                    fontSize: 9,
                    color: Colors.black,
                  ),
                )),
            Tab(
                icon: Icon(
                  Icons.search,
                  size: 18,
                  color: Colors.black,
                ),
                child: Text(
                  "검색",
                  style: TextStyle(
                    fontSize: 9,
                    color: Colors.black,
                  ),
                )),
            Tab(
                icon: Icon(
                  Icons.list,
                  size: 18,
                  color: Colors.black,
                ),
                child: Text(
                  "더보기",
                  style: TextStyle(
                    fontSize: 9,
                    color: Colors.black,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
