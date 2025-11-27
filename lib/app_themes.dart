import 'package:flutter/material.dart';

class AppThemes {

  static const Color myGreenColor = Color.fromARGB(255, 67, 234, 58);
  static final ThemeData lightTheme = ThemeData(
    
    colorScheme: ColorScheme.fromSeed(
      seedColor: myGreenColor,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.grey[100],
    
    textTheme: TextTheme(
      titleLarge: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: const TextStyle(
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
      backgroundColor: myGreenColor, 
      elevation: 4,
      titleTextStyle: const TextStyle( 
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(color: Colors.white), 
      actionsIconTheme: const IconThemeData(color: Colors.white),
    ),
  );

  // TEMA OSCURO
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: myGreenColor,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
    
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.grey[900], 
    
    textTheme: TextTheme(
      titleLarge: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: const TextStyle(
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
      backgroundColor: Colors.grey[850],
      elevation: 4,
      titleTextStyle: const TextStyle( 
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(color: Colors.white), 
      actionsIconTheme: const IconThemeData(color: Colors.white),
    ),
  );
}