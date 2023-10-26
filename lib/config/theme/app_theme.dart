import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.green,
  Color.fromRGBO(255, 235, 59, 1),
  Color.fromARGB(255, 255, 0, 0),
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.teal,
  Colors.cyan,

];

class AppTheme{
  final int selectedColor;

  AppTheme({
    this.selectedColor =0
  }):assert( selectedColor >= 0,"Selected color must be greater then 0"),
  assert( 
    selectedColor < colorList.length,"Selected color must be less or equal than ${colorList.length-1}");


  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor], // se da el color del tema de la app
    appBarTheme: const AppBarTheme(centerTitle: true), //se centraliza el titulo del appbar
  );
}