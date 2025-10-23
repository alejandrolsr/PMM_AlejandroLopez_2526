import 'package:flutter/material.dart';
import 'drawer/custom_drawer.dart';
import 'screens/info_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/gallery_screen.dart';
import 'screens/icons_screen.dart';
import 'screens/images_screen.dart';
import 'screens/text_screen.dart';
import 'screens/images2_screen.dart';
import 'screens/challenge_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Actividad Tema 1',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
      routes: {
        '/info': (context) => const InfoScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/gallery': (context) => const GalleryScreen(),
        '/icons': (context) => const IconsScreen(),
        '/images': (context) => const ImageGridScreen(),
        '/images2': (context) => const Images2Screen(),
        '/text': (context) => const TextScreen(),
        '/challenge': (context) => const ChallengeScreen(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Actividad Flutter Tema 1")),
      drawer: const CustomDrawer(),
      body: const Center(child: Text("Bienvenido al menú principal")),
    );
  }
}
