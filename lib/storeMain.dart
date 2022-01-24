import 'package:flutter/material.dart';

class SotreMain extends ChangeNotifier {
  String myName = 'Ash Kim';

  setMyName(_s) {
    myName = _s;
    notifyListeners();
  }

}

class SotreMember extends ChangeNotifier {
  int ifollower = 0;
  bool followed = false;

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
