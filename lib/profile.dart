import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './storeMain.dart' as sm;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('PSY'),),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Currently follower number : ' + context.watch<sm.StateStore>().ifollower.toString()),
          ElevatedButton(onPressed: (){
            context.read<sm.StateStore>().setFollower();// 함수쓸땐 read
          }, child: Text('Follow'))
        ],
      ),
    );
  }
}
