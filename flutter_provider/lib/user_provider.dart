import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String _name = 'Guest';

  String get name => _name;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }
}
