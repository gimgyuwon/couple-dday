import 'package:flutter/material.dart';
import 'package:u_and_i/screen/HomeScreen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'GrandifloraOne', // 기본 폰트: GrandifloaraOne

          // headline1
        textTheme: TextTheme(
            headline1: TextStyle(
            color: Colors.black,
            fontSize: 50.0,
            fontWeight: FontWeight.w900,
            fontFamily: 'GrandifloraOne'
          ),

          // headline2
          headline2: TextStyle(
            color: Colors.black,
            fontSize: 40.0,
            fontWeight: FontWeight.w900,
          ),

          // bodytext1
          bodyText1: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.w700,
          ),

          // bodytext2
          bodyText2: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        )
      ),
      home: HomeScreen(),
    )
  );
}
