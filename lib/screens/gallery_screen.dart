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
<<<<<<< HEAD
          Image(image: AssetImage("assets/images/pic1.png")),
          Image(image: AssetImage("assets/images/pic2.png")),
          Image(image: AssetImage("assets/images/pic3.png")),
=======
          Image(image: AssetImage("assets/images/img1.jpg")),
          Image(image: AssetImage("assets/images/img2.jpg")),
          Image(image: AssetImage("assets/images/img3.jpg")),
>>>>>>> e843e9bc085f45cea914252c431c106d6044af48
        ],
      ),
    );
  }
}
