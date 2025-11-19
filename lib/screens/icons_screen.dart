import 'package:flutter/material.dart';
import '../drawer/custom_drawer.dart';

class IconsScreen extends StatelessWidget {
  static const String routeName = '/icons';
  const IconsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Iconos")),
      drawer: const CustomDrawer(),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.home, size: 50, color: Colors.blue),
              SizedBox(height: 20),
              Icon(Icons.phone, size: 50, color: Colors.green),
              SizedBox(height: 20),
              Icon(Icons.mail, size: 50, color: Colors.red),
              SizedBox(height: 20),
              Icon(Icons.star, size: 50, color: Colors.orange),
              SizedBox(height: 20),
              Icon(Icons.settings, size: 50, color: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}