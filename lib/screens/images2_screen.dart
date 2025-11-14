import 'package:flutter/material.dart';
import '../drawer/custom_drawer.dart'; 

class Images2Screen extends StatelessWidget {
  
  static const String routeName = '/images2';

  const Images2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de filas y columnas anidadas'),
        backgroundColor: Colors.blue, 
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
        child: Column(
          children: [
            // --- Fila 1: 1 Elemento ---
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildImageColumn(
                  'assets/images/img1.jpg', 
                  'Elemento 1',
                ),
              ],
            ),
            
            const SizedBox(height: 30), 

            // --- Fila 2: 2 Elementos ---
            Row(
              children: [
                Expanded(
                  child: _buildImageColumn(
                    'assets/images/img2.jpg', 
                    'Elemento 2',
                  ),
                ),
                Expanded(
                  child: _buildImageColumn(
                    'assets/images/pic1.png', 
                    'Elemento 3',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30), // Espacio vertical entre filas

            // --- Fila 3: 3 Elementos ---
            
            Row(
              children: [
                Expanded(
                  child: _buildImageColumn(
                    'assets/images/pic2.png', 
                    'Elemento 4',
                  ),
                ),
                Expanded(
                  child: _buildImageColumn(
                    'assets/images/pic4.png', 
                    'Elemento 5',
                  ),
                ),
                Expanded(
                  child: _buildImageColumn(
                    'assets/images/pic5.png', 
                    'Elemento 6',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

 
  Widget _buildImageColumn(String imagePath, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min, 
      children: [
        Image.asset(
          imagePath,
          width: 100, 
          height: 100, 
          fit: BoxFit.cover, 
          
          //Error por si la imagen no carga
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 100,
              height: 100,
              color: Colors.grey[300],
              child: const Icon(
                Icons.broken_image,
                color: Colors.red,
                size: 50,
              ),
            );
          },
        ),
        const SizedBox(height: 8), // Espacio entre imagen y texto
        Text(
          label,
          textAlign: TextAlign.center, 
        ),
      ],
    );
  }
}