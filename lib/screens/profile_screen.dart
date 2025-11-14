import 'package:flutter/material.dart';
import '../drawer/custom_drawer.dart'; 

class ProfileScreen extends StatelessWidget {
  
  static const String routeName = '/profile';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Perfil")),
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/images/yo.jpg"), 
            ),
            const SizedBox(height: 15),
            const Text("Alejandro López-Salvatierra Ruiz",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}