import 'package:flutter/material.dart';

class ImagesScreen extends StatelessWidget {
  const ImagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Imágenes")),
      body: Column(
        children: const [
          Expanded(child: Image(image: AssetImage("assets/images/img1.jpg"))),
          Expanded(child: Image(image: AssetImage("assets/images/img2.jpg"))),
          Expanded(child: Image(image: AssetImage("assets/images/img3.jpg"))),
          Expanded(child: Image(image: AssetImage("assets/images/img4.jpg"))),
          Expanded(child: Image(image: AssetImage("assets/images/img5.jpg"))),
        ],
      ),
    );
  }
}
