import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_stories/flutter_instagram_stories.dart';



void main(){
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  static String collectionDbName = 'story';
  CollectionReference dbInstance =
      FirebaseFirestore.instance.collection(collectionDbName);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter instagram stories"),
      ),
      body: Column(
        children: <Widget>[
          FlutterInstagramStories(
            collectionDbName: collectionDbName,
            showTitleOnIcon: true,
            backFromStories: () {
              _backFromStoriesAlert();
            },
            iconTextStyle: const TextStyle(
              fontSize: 14.0,
              color: Colors.white,
            ),
            iconImageBorderRadius: BorderRadius.circular(15.0),
            iconBoxDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              color: Color(0xFFffffff),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff333333),
                  blurRadius: 10.0,
                  offset: Offset(
                    0.0,
                    4.0,
                  ),
                ),
              ],
            ),
            iconWidth: 150.0,
            iconHeight: 150.0,
            textInIconPadding:
                const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 12.0),
            //how long story lasts in seconds
            imageStoryDuration: 7,
            progressPosition: ProgressPosition.top,
            repeat: true,
            inline: false,
            languageCode: 'en',
            backgroundColorBetweenStories: Colors.black,
            closeButtonIcon: const Icon(
              Icons.close,
              color: Colors.white,
              size: 28.0,
            ),
            closeButtonBackgroundColor: const Color(0x11000000),
            sortingOrderDesc: true,
            lastIconHighlight: true,
            lastIconHighlightColor: Colors.deepOrange,
            lastIconHighlightRadius: const Radius.circular(15.0),
            captionTextStyle: const TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
            captionMargin: const EdgeInsets.only(
              bottom: 50,
            ),
            captionPadding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 8,
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "App's functuonality",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _backFromStoriesAlert() {
    showDialog(
      context: context,
      builder: (_) => SimpleDialog(
        title: const Text(
          "User have looked stories and closed them.",
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18.0),
        ),
        children: <Widget>[
          SimpleDialogOption(
            child: const Text("Dismiss"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}