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

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
      body: Container(
        child: Text('test text', style: Theme.of(context).textTheme.bodyText1,), // style class 변경
      ),

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
            label: 'Business',
          ),
        ],
        // currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        // onTap: _onItemTapped,
      ),
    );
  }
}
