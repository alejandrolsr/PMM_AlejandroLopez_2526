import 'package:flutter/material.dart';

class AppThemes {

  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.indigo,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.grey[100],
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: Colors.black87,
        fontSize: 16,
      ),
      labelSmall: TextStyle(
        color: Colors.grey[700],
        fontSize: 14,
        fontStyle: FontStyle.italic,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: Colors.indigo[600],
      elevation: 4,
      titleTextStyle: TextStyle( 
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.white), 
      actionsIconTheme: IconThemeData(color: Colors.white),
    ),
  );

  //TEMA OSCURO
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.indigo,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.grey[900], 
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: Colors.white70,
        fontSize: 16,
      ),
      labelSmall: TextStyle(
        color: Colors.grey[400],
        fontSize: 14,
        fontStyle: FontStyle.italic,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: Colors.grey[850],
      elevation: 4,
      titleTextStyle: TextStyle( 
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.white), 
      actionsIconTheme: IconThemeData(color: Colors.white),
    ),
  );
}