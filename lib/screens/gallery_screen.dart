import 'package:flutter/material.dart';
import '../drawer/custom_drawer.dart';

class GalleryScreen extends StatelessWidget {
  static const String routeName = '/gallery';

  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Galería")),
      drawer: const CustomDrawer(),
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(8.0),
        children: const [
          Image(image: AssetImage("assets/images/pic1.png")),
          Image(image: AssetImage("assets/images/pic2.png")),
          Image(image: AssetImage("assets/images/pic3.png")),
        ],
      ),
    );
  }
}