import 'package:flutter/material.dart';

class SignupData extends ChangeNotifier {
  String _id = '';
  String _pw = '';
  String _name = '';
  String _email = '';
  String _status = '';
  String _grade = '';

  String get id => _id;
  String get pw => _pw;
  String get name => _name;
  String get email => _email;
  String get status => _status;
  String get grade => _grade;

  void inputId(String id1) {
    _id = id1;
    notifyListeners();
  }

  void inputPw(String pw1) {
    _pw = pw1;
    notifyListeners();
  }

  void inputName(String name1) {
    _name = name1;
    notifyListeners();
  }

  void inputEmail(String email1) {
    _email = email1;
    notifyListeners();
  }

  void inputStatus(String status1) {
    _status = status1;
    notifyListeners();
  }
  
  void inputGrade(String grade1) {
    _grade = grade1;
    notifyListeners();
  }
}
