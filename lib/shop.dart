import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import './storeMain.dart' as sm;

final firestore = FirebaseFirestore.instance;

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
          print(doc['name']);
        }
      }
      Map<String, dynamic> _param = {'name':'pants', 'price':100};
      await firestore.collection('product').add(_param);
      print('inserted');

      //var result2 = await firestore.collection('product').doc().delete(); .update()

    } catch (e) {
      print(e);
    }

  }

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('body'),

    );
  }
}
