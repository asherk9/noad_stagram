import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import './style.dart' as main_style;
import './upload.dart' as upload_page;
import './items.dart' as loop_items;
import './storeMain.dart' as sm;
import './notification.dart' as noti;

void main() {
  runApp(
    MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (c) => sm.StoreMain()),
        ChangeNotifierProvider(create: (c) => sm.StoreMember()),
      ],
      child: MaterialApp(
        home : MyStful(),
        theme: main_style.myTheme,
      ),
    )
  );
}

class MyStful extends StatefulWidget {
  const MyStful({Key? key}) : super(key: key);
  @override
  _MyStfulState createState() => _MyStfulState();
}

class _MyStfulState extends State<MyStful> {
  // int _SelectedPageIndex = 0;
  // PageController pgController = PageController();
  List jsonResult = [];
  bool showFlag = true;
  var newImage;

  @override
  void initState() {
    super.initState();
    getData();
    saveDataPreference();
    noti.initNotification();
  }

  setNewUpload(con) {
    Map _newData = {
      "id": jsonResult.length+10,
      "image": newImage,
      "likes": 0,
      "date": "Jan 23",
      "content": con,
      "liked": false,
      "user": "ash"
    };
    setState(() {
      jsonResult.insert(0, _newData);
    });
  }

  saveDataPreference() async {
    // 이미지 캐싱은 cached_network_image: ^3.2.0
    var storage = await SharedPreferences.getInstance();
    storage.setString('name', 'Ash'); // 환경은 맵 스타일 key-value
    print(storage.getString('name'));
    storage.remove('name');

    Map vo = {'name':'ash', 'age':20};
    storage.setString('vo', jsonEncode(vo));
    String strVo = storage.getString('vo') ?? 'null';
    print(jsonDecode( strVo )['age']);

  }

  getData() async {
    var _result = await http.get( Uri.parse('https://asherk9.github.io/share/sample.json') );
    setState(() {
      if (_result.statusCode == 200) {
        jsonResult = jsonDecode(_result.body);
      }
    });
  }

  get1Data() async {
    var _result = await http.get( Uri.parse('https://codingapple1.github.io/app/more1.json') );
    setState(() {
      if (_result.statusCode == 200) {
        Map more = jsonDecode(_result.body);
        jsonResult.add(more);
        print(jsonResult);
      }
    });
  }

  setShowFlag(bool _flag) {
    setState(() {
      showFlag = _flag;
    });
  }

  void _onItemTapped(int index) {
    // setState(() {
    //   _SelectedPageIndex = index;
    // });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('No AD stagram'),
        actions: [
          IconButton(
            icon: Icon(Icons.add_box_outlined),
            iconSize: 30,
            onPressed: () async {
              var picker = ImagePicker();
              var image = await picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                setState((){
                  newImage = File(image.path); // 내가 이걸 못찾아서 헤매었구나
                });
              }

              Navigator.push(context,
                MaterialPageRoute(builder: (c2) => upload_page.UploadPage(setNewUpload: setNewUpload, newImage:newImage) )
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.alarm),
            onPressed: (){ noti.showNotification(); },
          ),
        ],
      ),
      body: loop_items.Items(data:jsonResult, get1Data:get1Data, setShowFlag:setShowFlag),

      bottomNavigationBar: showFlag? BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Shop',
          ),
        ],
        // currentIndex: _SelectedPageIndex,
        // selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped, // onPressed 기능

      ) : SizedBox(height: 10,),
    );
  }
}



