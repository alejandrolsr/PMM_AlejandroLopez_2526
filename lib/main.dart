import 'package:flutter/material.dart';
import 'screens/screens.dart'; 
import 'app_themes.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  
  static MyAppState of(BuildContext context) {
    return context.findAncestorStateOfType<MyAppState>()!;
  }

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  
  ThemeMode _themeMode = ThemeMode.light;

  
  void toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  
  ThemeMode get currentThemeMode => _themeMode;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Actividad Flutter',
      
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: _themeMode,

      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        InfoScreen.routeName: (context) => const InfoScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        GalleryScreen.routeName: (context) => const GalleryScreen(),
        IconsScreen.routeName: (context) => const IconsScreen(),
        ImageGridScreen.routeName: (context) => const ImageGridScreen(),
        Images2Screen.routeName: (context) => const Images2Screen(),
        TextScreen.routeName: (context) => const TextScreen(),
        ChallengeScreen.routeName: (context) => const ChallengeScreen(),
        ContadorClickScreen.routeName: (context) => const ContadorClickScreen(),
        InstagramScreen.routeName: (context) => InstagramScreen(),
        RandomColors.routeName: (context) => const RandomColors(),
        TapGameScreen.routeName: (context) => const TapGameScreen(),
      },
    );
  }
}