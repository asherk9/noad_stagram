import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './storeMain.dart' as sm;

class Profile extends StatefulWidget {
  Profile({Key? key, this.userName}) : super(key: key);
  final userName;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('PSY'), actions: [
        IconButton(
          onPressed: (){Navigator.pop(context); },
          icon: Icon(Icons.close),
      ),],),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Currently follower number : ' + context.watch<sm.SotreMember>().ifollower.toString()),
          ElevatedButton(onPressed: (){
            context.read<sm.SotreMember>().setFollower();// 함수쓸땐 read
          }, child: Text('Follow'))
        ],
      ),
    );
  }
}
