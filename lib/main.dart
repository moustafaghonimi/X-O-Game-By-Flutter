import 'package:flutter/material.dart';
import 'package:x_o/game.dart';

import 'loginScreen.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'X-O',
    initialRoute:LoginScreen.routeName ,
    routes:{
      LoginScreen.routeName:(c)=>LoginScreen(),
      GameScreen.routeName:(c)=>GameScreen(),

    },
theme: ThemeData(
  textTheme:TextTheme(
    headline1: TextStyle( color: Colors.indigo,fontSize: 22,fontWeight: FontWeight.bold),
    headline2: TextStyle( color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),
    headline3: TextStyle( color: Colors.blue,fontSize: 25,fontWeight: FontWeight.bold),
    headline4: TextStyle( color: Colors.blue,fontSize: 35,fontWeight: FontWeight.bold,),


  )
),
  ),);
}