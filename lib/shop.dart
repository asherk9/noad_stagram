import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './storeMain.dart' as sm;

final firestore = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;

class ShopMain extends StatefulWidget {
  const ShopMain({Key? key}) : super(key: key);

  @override
  _ShopMainState createState() => _ShopMainState();
}

class _ShopMainState extends State<ShopMain> {

  getProduct() async {
    try {
      // select by id.  .collection('product').doc('z1').get(); or .where().get()
      // insert. .collection('product').add({'name':'pants', 'price':100});
      var result = await firestore.collection('product').get();
      // i 버전 for(int i=0;i<result.size;i++)
      if (result.docs.isNotEmpty) {
        for (var doc in result.docs) {
          // print(doc['name']);
        }
      }

      // 데이터 검증

      // Map<String, dynamic> _param = {'name':'pants', 'price':100};
      // await firestore.collection('product').add(_param);
      // print('inserted');
      Map<String, dynamic> _param = {'price':100};
      // var result2 = await firestore.collection('product').doc('MezdvprCyrgcG9mzmygR').update(_param);
      // var result2 = await firestore.collection('product').doc('MezdvprCyrgcG9mzmygR').delete(); .update()
    } catch (e) {
      print(e);
    }
  }

  getLoginData() async {
    try {
      /*
      var result = await auth.createUserWithEmailAndPassword(
        email: 'test@gmail.com',
        password: '123456',
      );
      result.user?.updateDisplayName('john'); // ?는 null 체크
      print(result);
*/
      await auth.signOut();
      await auth.signInWithEmailAndPassword(
        email: 'test@gmail.com',
        password: '123456',
      );

      if( auth.currentUser?.uid == null) {
        print('not login yet');
      } else {
        print('already login.');
        print(auth.currentUser?.uid);
        print(auth.currentUser?.displayName);
      }

    } catch(e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getProduct();
    //getLoginData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('body'),

    );
  }
}
