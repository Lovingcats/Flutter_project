import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryPageView extends StatefulWidget {
  @override
  _StoryPageViewState createState() => _StoryPageViewState();
}

class _StoryPageViewState extends State<StoryPageView> { //인스타 스토리 기능 구현
  final controller = StoryController();

  @override
  Widget build(BuildContext context) {
    final List<StoryItem> storyItems = [
      StoryItem.text(
          title: '''인스타 스토리 구현''',
          backgroundColor: Colors.blueGrey,
          textStyle: TextStyle(fontSize: 30)),
      // StoryItem.pageImage(
      //     url:
      //         "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
      //     controller: controller),
      StoryItem.inlineImage(
          url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
          controller: controller,
          imageFit: BoxFit.contain),
    ];
    return Material(
      child: StoryView(
        storyItems: storyItems,
        controller: controller,
        inline: false,
        repeat: true,
      ),
    );
  }
}
