import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
  Colors.red,
  Colors.purpleAccent
];



class AppTheme{

  final int selectedColor;

  AppTheme({
    this.selectedColor=0
  }): assert( selectedColor >= 0, 'selectedColor must be greater than zero'),
      assert( selectedColor < colorList.length, 'selectedColor must be less or equal than ${colorList.length-1}');
  
  ThemeData getTheme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(
        centerTitle: true
      )
    );
  }
}

