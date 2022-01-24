import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StoreMain extends ChangeNotifier {
  String myName = 'Ash Kim';

  setMyName(_s) {
    myName = _s;
    notifyListeners();
  }

}

class StoreMember extends ChangeNotifier {
  int ifollower = 0;
  bool followed = false;
  List profileImages = [];

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

  // Profile getData
  getProfileImages() async {
    var _result = await http.get( Uri.parse('https://codingapple1.github.io/app/profile.json') );
    if (_result.statusCode == 200) {
      profileImages = jsonDecode(_result.body);
      print(profileImages.length);
    }
    notifyListeners();
  }

}
