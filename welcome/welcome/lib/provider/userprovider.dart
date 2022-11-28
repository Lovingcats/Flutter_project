import 'package:flutter/material.dart';

class UserData extends ChangeNotifier {
  String _accessToekn = '';
  String _userName = '';
  String _userId = '';
  bool _login = false;

  String get accessToken => _accessToekn;
  String get userName => _userName;
  String get userId => _userId;
  bool get login => _login;

  void loginChange(bool bools) {
    _login = bools;
    notifyListeners();
  }

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
