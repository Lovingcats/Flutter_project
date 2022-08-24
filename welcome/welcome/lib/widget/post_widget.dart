import 'package:flutter/material.dart';
import 'package:welcome/model/post.dart';

// ignore: camel_case_types
class Post_widget extends StatefulWidget {
  final List<Post> posts;

  const Post_widget({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  State<Post_widget> createState() => _Post_widgetState();
}

// ignore: camel_case_types
class _Post_widgetState extends State<Post_widget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.posts.length,
        itemBuilder: (context, index) {
          return Padding(padding: EdgeInsets.all(1));
        },
      ),
    );
  }
}
