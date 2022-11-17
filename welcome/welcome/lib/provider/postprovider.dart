import 'package:flutter/material.dart';
import 'package:welcome/model/post.dart';

class PostProviderData extends ChangeNotifier {
  late List<Post> _normalPosts = <Post>[];
  late List<Post> _blindPosts = <Post>[];
  late List<Post> _advicePosts = <Post>[];
  List<Post> get normalPosts => _normalPosts;
  List<Post> get blindPosts => _blindPosts;
  List<Post> get advicePosts => _advicePosts;

  void inputNormalData(
      String title, int views, String contact, int heart, String userName) {
    normalPosts.add(Post(title, views, contact, heart, userName));
  }

  void inputBlindData(
      String title, int views, String contact, int heart, String userName) {
    blindPosts.add(Post(title, views, contact, heart, userName));
  }

  void inputAdviceData(
      String title, int views, String contact, int heart, String userName) {
    advicePosts.add(Post(title, views, contact, heart, userName));
  }

  void clearly() {
    normalPosts.clear();
    blindPosts.clear();
    advicePosts.clear();
    notifyListeners();  
  }
}
