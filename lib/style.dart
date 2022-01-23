import 'package:flutter/material.dart';

var myTheme = ThemeData(
  iconTheme: IconThemeData(
    color: Colors.deepOrangeAccent,
  ),
  appBarTheme: AppBarTheme(
    color: Colors.white,
    elevation: 1,//그림자 크기
    titleTextStyle: TextStyle(color:Colors.black87),
    actionsIconTheme: IconThemeData(color: Colors.black87),
  ),
  textTheme: TextTheme(
    bodyText2: TextStyle(color:Colors.black87),
    bodyText1: TextStyle(color:Colors.black38),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: Colors.grey,
    )
  ),
  // bottomAppBarTheme: BottomAppBarTheme(
  //     color:Colors.black87;
  // )
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.black87,
    // unselectedItemColor: Colors.black12,
  )
);