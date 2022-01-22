import 'package:flutter/material.dart';

var myTheme = ThemeData(
  iconTheme: IconThemeData(
    color: Colors.red,
  ),
  appBarTheme: AppBarTheme(
    color: Colors.white,
    elevation: 1,//그림자 크기
    titleTextStyle: TextStyle(color:Colors.black87),
    actionsIconTheme: IconThemeData(color: Colors.black87),
  ),
  textTheme: TextTheme(
    bodyText2: TextStyle(color:Colors.deepOrange),
    bodyText1: TextStyle(color:Colors.deepPurple),
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