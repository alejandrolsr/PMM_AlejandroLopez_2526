import 'package:flutter/material.dart';

class ImageGridScreen extends StatelessWidget {
  const ImageGridScreen({super.key});

  // Ruta de la imagen local para la Fila 1
  final String _assetPath1 = 'assets/images/img1.jpg'; 
  
  // URL para la Fila 2
  final String _imageUrl2 = 'https://picsum.photos/id/200/100/100'; 
  
  // URL para la Fila 3
  final String _imageUrl3 = 'https://picsum.photos/id/210/100/100'; 

  // Widget para crear un contenedor de imagen con tamaño y márgenes
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
      // Usamos Column para apilar las filas verticalmente
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Alinea todo el contenido a la izquierda
        children: <Widget>[
        
          Row(
            children: [
              _buildImageContainer(
                Image.asset(
                  _assetPath1, 
                  fit: BoxFit.cover,
                  // Si falla la carga local, mostramos un icono
                  errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.broken_image, color: Colors.red)),
                ), 
                size: 80,
              ),
            ],
          ),

          
          Row(
            children: [
              const SizedBox(width: 0), // Desplaza a la derecha para la segunda fila
              _buildImageContainer(
                Image.network(
                  _imageUrl2, 
                  fit: BoxFit.cover,
                  // Mientras carga de red, muestra un indicador
                  loadingBuilder: (context, child, loadingProgress) => loadingProgress == null 
                    ? child 
                    : const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                  // Si falla la carga de red, muestra un icono
                  errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.error_outline, color: Colors.grey)),
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
                  errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.error_outline, color: Colors.grey)),
                ), 
                size: 80,
              ),
            ],
          ),

          
          Row(
            children: [
              const SizedBox(width: 0), 
              _buildImageContainer(
                Image.network(
                  _imageUrl3, 
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) => loadingProgress == null 
                    ? child 
                    : const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                  errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.error_outline, color: Colors.grey)),
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
                  errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.error_outline, color: Colors.grey)),
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
                  errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.error_outline, color: Colors.grey)),
                ), 
                size: 80,
              ),
            ],
          ),
        ],
      ),
    );
  }
}