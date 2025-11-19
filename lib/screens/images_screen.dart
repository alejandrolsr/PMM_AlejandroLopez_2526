import 'package:flutter/material.dart';
import '../drawer/custom_drawer.dart';

class ImageGridScreen extends StatelessWidget {
  static const String routeName = '/images';

  const ImageGridScreen({super.key});

  final String _assetPath1 = 'assets/images/img1.jpg';
  final String _imageUrl2 = 'https://picsum.photos/id/200/100/100';
  final String _imageUrl3 = 'https://picsum.photos/id/210/100/100';

  Widget _buildImageContainer(Widget imageWidget, {required double size}) {
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: imageWidget,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Disposición de Imágenes"),
        backgroundColor: Colors.blueGrey,
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView( // <-- Scroll añadido aquí
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                _buildImageContainer(
                  Image.asset(
                    _assetPath1,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Center(child: Icon(Icons.broken_image, color: Colors.red)),
                  ),
                  size: 80,
                ),
              ],
            ),
            Row(
              children: [
                _buildImageContainer(
                  Image.network(
                    _imageUrl2,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) => loadingProgress == null
                        ? child
                        : const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                    errorBuilder: (context, error, stackTrace) =>
                        const Center(child: Icon(Icons.error_outline, color: Colors.grey)),
                  ),
                  size: 80,
                ),
                _buildImageContainer(
                  Image.network(
                    _imageUrl2,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) => loadingProgress == null
                        ? child
                        : const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                    errorBuilder: (context, error, stackTrace) =>
                        const Center(child: Icon(Icons.error_outline, color: Colors.grey)),
                  ),
                  size: 80,
                ),
              ],
            ),
            Row(
              children: [
                _buildImageContainer(
                  Image.network(
                    _imageUrl3,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) => loadingProgress == null
                        ? child
                        : const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                    errorBuilder: (context, error, stackTrace) =>
                        const Center(child: Icon(Icons.error_outline, color: Colors.grey)),
                  ),
                  size: 80,
                ),
                _buildImageContainer(
                  Image.network(
                    _imageUrl3,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) => loadingProgress == null
                        ? child
                        : const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                    errorBuilder: (context, error, stackTrace) =>
                        const Center(child: Icon(Icons.error_outline, color: Colors.grey)),
                  ),
                  size: 80,
                ),
                _buildImageContainer(
                  Image.network(
                    _imageUrl3,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) => loadingProgress == null
                        ? child
                        : const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                    errorBuilder: (context, error, stackTrace) =>
                        const Center(child: Icon(Icons.error_outline, color: Colors.grey)),
                  ),
                  size: 80,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}