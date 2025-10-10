import 'package:flutter/material.dart';

class IconsScreen extends StatelessWidget {
  const IconsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Iconos")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.home, size: 50, color: Colors.blue),
          Icon(Icons.phone, size: 50, color: Colors.green),
          Icon(Icons.mail, size: 50, color: Colors.red),
          Icon(Icons.star, size: 50, color: Colors.orange),
          Icon(Icons.settings, size: 50, color: Colors.purple),
        ],
      ),
    );
  }
}
