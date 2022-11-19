import 'package:flutter/material.dart';

class UserData extends ChangeNotifier {
  String _accessToekn = '';
  String _userName = '';
  String _userId = '';

  String get accessToken => _accessToekn;
  String get userName => _userName;
  String get userId => _userId;

  void inputAccessToken(String accessToken) {
    _accessToekn = accessToken;
    notifyListeners();
  }

  void inputDatas(String userName1, String userId1) {
    _userName = userName1;
     _userId = userId1;
    notifyListeners();
  }
}
