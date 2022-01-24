import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './storeMain.dart' as sm;

class UploadPage extends StatelessWidget {
  UploadPage({Key? key, this.setNewUpload, this.newImage}) : super(key: key);
  var setNewUpload;
  var _newContent;
  var newImage;
  var _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 키보드에 안가려지게
      appBar: AppBar(
        title: Text('Add new photo by ' + context.watch<sm.StoreMain>().myName),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(onChanged: (a1){_newContent=a1;},),
          IconButton(
            onPressed: (){ setNewUpload(_newContent); },
            icon: Icon(Icons.cloud_upload_outlined),
          ),
          //Image.file(_image),
          IconButton(
            onPressed: (){Navigator.pop(context); },
            icon: Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}