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
  final bool isDarkMode;

  AppTheme({
    this.selectedColor =0,
    this.isDarkMode = false
  }):assert( selectedColor >= 0,"Selected color must be greater than 0"),
  assert( 
    selectedColor < colorList.length,"Selected color must be less or equal than ${colorList.length-1}");


  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[selectedColor], // se da el color del tema de la app
    appBarTheme: const AppBarTheme(centerTitle: true), //se centraliza el titulo del appbar
  );

  AppTheme copyWith({ //esto sirve para crear un estado y no tener problemas con los final
    int? selectedColor,
    bool? isDarkMode
}) => AppTheme(
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkMode: isDarkMode ?? this.isDarkMode
  );
}