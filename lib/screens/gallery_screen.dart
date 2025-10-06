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
          Image(image: AssetImage("assets/images/img1.jpg")),
          Image(image: AssetImage("assets/images/img2.jpg")),
          Image(image: AssetImage("assets/images/img3.jpg")),
        ],
      ),
    );
  }
}
