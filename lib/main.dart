import 'package:flutter/material.dart';
import './style.dart' as main_style;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';

void main() {
  runApp(
      MaterialApp(
        home : MyStful(),
        theme: main_style.myTheme,
      )
  );
}



class myHome extends StatefulWidget {
  myHome({Key? key, this.data, this.get1Data, this.setShowFlag}) : super(key: key);
  final data, get1Data, setShowFlag;


  @override
  State<myHome> createState() => _myHomeState();
}

class _myHomeState extends State<myHome> {
  var scroll = ScrollController();
  bool bRenewal = true;
  bool isMenuHide = false;

  @override
  void initState() {
    super.initState();
    print('_myHomeState load');
    scroll.addListener(() {
      // print(scroll.position.userScrollDirection);
      if(scroll.position.userScrollDirection == ScrollDirection.reverse){
        print('아래로 reverse이면 하단바 숨기자');
        if(!isMenuHide) {
          widget.setShowFlag(isMenuHide);
          isMenuHide = true;
        }
      }
      if(scroll.position.userScrollDirection == ScrollDirection.forward){
        print('위로 reverse이면 하단바 보이기');
        if(isMenuHide) {
          widget.setShowFlag(isMenuHide);
          isMenuHide = false;
        }
      }
      if(scroll.position.pixels == scroll.position.maxScrollExtent) {
        print('끝부근. renewal 필요');
        if(bRenewal) {
          widget.get1Data();
          bRenewal = false;
        }
      }
    });
  }

  @override
  void dispose() {
    scroll.removeListener(() { });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.data.isNotEmpty) {
      return ListView.builder(
          itemCount: widget.data.length,
          padding: EdgeInsets.all(8),
          controller: scroll,
          itemBuilder: (BuildContext c, int i){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(widget.data[i]['image']),
                Text(widget.data[i]['content']),
                Text('작성자:${widget.data[i]['user']}'),
                Text(widget.data[i]['date']),
              ],
            );
          }
      );
    } else {
      return Text('loading');
    }
  }
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

  @override
  void initState() {
    super.initState();
    print('app load');
    getData();
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
        var more = jsonDecode(_result.body);
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
          IconButton(onPressed: (){}, icon: Icon(Icons.add_box_outlined), iconSize: 30,),
          Icon(Icons.menu),
        ],
      ),
      body: myHome(data:jsonResult, get1Data:get1Data, setShowFlag:setShowFlag),

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



