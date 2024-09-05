import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.cyan,
  Colors.green,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
  Colors.red,
  Colors.purpleAccent
];



class AppTheme{

  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.isDarkMode=false,
    this.selectedColor=0
  }): assert( selectedColor >= 0, 'selectedColor must be greater than zero'),
      assert( selectedColor < colorList.length, 'selectedColor must be less or equal than ${colorList.length-1}');
  
  ThemeData getTheme(){
    return ThemeData(
      useMaterial3: true,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor: isDarkMode ? Colors.black : Colors.white,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
      ), 
      drawerTheme: DrawerThemeData(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        )
    );
  }
}




/* Backup

class AppTheme{

  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.isDarkMode=false,
    this.selectedColor=0
  }): assert( selectedColor >= 0, 'selectedColor must be greater than zero'),
      assert( selectedColor < colorList.length, 'selectedColor must be less or equal than ${colorList.length-1}');
  
  ThemeData getTheme(){
    return ThemeData(
      useMaterial3: true,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor: isDarkMode ? Colors.black : Colors.white,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
      ), 
      drawerTheme: DrawerThemeData(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        )
    );
  }
} */