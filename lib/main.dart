import 'package:flutter/material.dart';
import './style.dart' as main_style;
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
      MaterialApp(
        home : MyStful(),
        theme: main_style.myTheme,
      )
  );
}



class myHome extends StatelessWidget {
  myHome({Key? key, this.data}) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {

    if(data.isNotEmpty) {
      return ListView.builder(
          itemCount: data.length,
          padding: EdgeInsets.all(8),
          itemBuilder: (BuildContext c, int i){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(data[i]['image']),
                Text(data[i]['content']),
                Text(data[i]['user']),
                Text(data[i]['date']),
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
      body: myHome(data:jsonResult),

      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}



