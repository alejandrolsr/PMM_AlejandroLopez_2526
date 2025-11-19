import 'package:flutter/material.dart';
import '../drawer/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Actividad Flutter")),
      drawer: const CustomDrawer(),
      body: Center(
        child: SingleChildScrollView(
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text("Bienvenido al menú principal"),
          ),
        ),
      ),
    );
  }
}