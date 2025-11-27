import 'package:flutter/material.dart';

class PostGrid extends StatelessWidget {

  const PostGrid({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),

      itemCount: 9, 
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, //3 columnas
        crossAxisSpacing: 2, //Espacio entre columnas
        mainAxisSpacing: 2,  //Espacio entre filas
      ),
      itemBuilder: (context, index) {
        // Ruta de imagenes
        final imagePath = 'assets/images/ig/foto${index + 1}.jpg';

        return Image.asset(
          imagePath,
          fit: BoxFit.cover,
          
          // Muestra un icono de error si la imagen no se encuentra
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[200],
              child: Icon(Icons.broken_image, color: Colors.grey[400]),
            );
          },
        );
      },
    );
  }
}