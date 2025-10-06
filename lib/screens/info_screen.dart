import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Info")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Alejandro López-Salvatierra Ruiz",
              style: TextStyle(
                fontSize: 24,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "https://github.com/alejandrolsr/PMM_AlejandroLopez_2526",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontFamily: 'Courier', // fuente tipo monoespaciada
              ),
            ),
          ],
        ),
      ),
    );
  }
}
