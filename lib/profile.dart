import 'dart:io';

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
    List profileList = context.watch<sm.StoreMember>().profileImages;

    return Scaffold(
      body: CustomScrollView(
        slivers : [
          SliverAppBar(title: Text(widget.userName),
            pinned: true,
            actions: [
              IconButton(
                onPressed: (){Navigator.pop(context); },
                icon: Icon(Icons.close),
              )
          ],),
          SliverToBoxAdapter( child: ProfileHeader(),),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (c,i)=> Container(
                padding:EdgeInsets.all(3),
                child: Image.network(profileList[i]),
              ),
              childCount: profileList.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          ),
        ]
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleAvatar(radius: 30, backgroundColor: Colors.grey,),
        Text('follower : ' + context.watch<sm.StoreMember>().ifollower.toString()),
        ElevatedButton(onPressed: (){
          context.read<sm.StoreMember>().setFollower();// 함수쓸땐 read
        }, child: Text('Follow')),
        ElevatedButton(onPressed: (){
          context.read<sm.StoreMember>().getProfileImages();// 함수쓸땐 read
        }, child: Text('get images')),
      ],
      // list getProfileImages()
    );
  }
}

