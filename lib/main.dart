import 'package:flutter/material.dart';
import './style.dart' as main_style;

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedPageIndex = index;

    });
  }

  @override
  Widget build(BuildContext context) {

    var myPageVIew = PageView(
      controller: pgController,
      children: [
        Text('first tab'),
        Text('Second tab'),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('No AD stagram'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add_box_outlined), iconSize: 30,),
          Icon(Icons.menu),
        ],
      ),
      body: myPageVIew,

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



