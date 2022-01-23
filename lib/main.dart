import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './style.dart' as main_style;
import './upload.dart' as upload_page;
import './items.dart' as loop_items;

void main() {
  runApp(
      MaterialApp(
        home : MyStful(),
        theme: main_style.myTheme,
      )
  );
}

class MyStful extends StatefulWidget {
  const MyStful({Key? key}) : super(key: key);
  @override
  _MyStfulState createState() => _MyStfulState();
}

class _MyStfulState extends State<MyStful> {
  int _selectedPageIndex = 0;
  PageController pgController = PageController();
  List jsonResult = [];
  bool showFlag = true;
  var newImage;
  var newContent;

  @override
  void initState() {
    super.initState();
    print('app load');
    getData();
  }

  setNewUpload(con, img) {
    Map _newData = {
      "id": jsonResult.length+10,
      "image": img,
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
    setState(() {
      _selectedPageIndex = index;

    });
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
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (c2) => upload_page.UploadPage(setNewUpload: setNewUpload) )
              );
            },
          ),
          Icon(Icons.menu),
        ],
      ),
      body: loop_items.myHome(data:jsonResult, get1Data:get1Data, setShowFlag:setShowFlag),

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
        // currentIndex: _selectedPageIndex,
        // selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped, // onPressed 기능

      ) : SizedBox(height: 10,),
    );
  }
}
