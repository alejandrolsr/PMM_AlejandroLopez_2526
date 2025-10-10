import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Galería")),
      body: GridView.count(
        crossAxisCount: 3,
        children: const [
          Image(image: AssetImage("assets/images/pic1.png")),
          Image(image: AssetImage("assets/images/pic2.png")),
          Image(image: AssetImage("assets/images/pic3.png")),
        ],
      ),
    );
  }
}
