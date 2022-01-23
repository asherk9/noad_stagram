import 'package:flutter/material.dart';

class StateStore extends ChangeNotifier {
  String myName = 'Ash Kim';
  int ifollower = 0;
  bool followed = false;

  setMyName(_s) {
    myName = _s;
    notifyListeners();
  }

  setFollower() {
    if(followed) {
      ifollower--;
      followed = false;
    } else {
      ifollower++;
      followed = true;
    }
    notifyListeners();
  }
}
