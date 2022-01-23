import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadPage extends StatelessWidget {
  UploadPage({Key? key, this.setNewUpload}) : super(key: key);
  var setNewUpload;
  var _newContent;
  var _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new photo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () async {
              var picker = ImagePicker();
              File _xfile = (await picker.pickImage(source: ImageSource.gallery)) as File;
              _image = _xfile;
              print(_xfile);
              print(_image);
            },
            icon: Icon(Icons.add_a_photo),
          ),
          TextField(onChanged: (a1){_newContent=a1;},),
          IconButton(
            onPressed: (){ setNewUpload(_newContent, _image); },
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