import 'package:flutter/material.dart';
import './style.dart' as main_style;

void main() {
  runApp(
      MaterialApp(
        home : MyApp(),
        theme: main_style.myTheme,
      )
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
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
      body: Theme(
        data: ThemeData(
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              )
          ),
        ),
        child: Container(
            child: TextButton(onPressed:(){}, child: Text('text button'),)
        ),
      )
    );

  }
}