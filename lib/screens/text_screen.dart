import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart'; 
import '../drawer/custom_drawer.dart';

class TextScreen extends StatelessWidget {
  
  static const String routeName = '/text';

  const TextScreen({super.key});

  // Estilo para la Fila 1
  TextStyle get _marqueeTextStyle => GoogleFonts.lato(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.red[800],
      );

  // Estilo para la Fila 2
  final TextStyle _systemTextStyle = const TextStyle(
    fontSize: 26,
    fontFamily: 'RobotoMono', 
    color: Colors.blue,
  );

  // Estilo para la Fila 3
  final TextStyle _genericTextStyle = const TextStyle(
    fontSize: 35,
    fontFamily: 'Georgia', 
    fontStyle: FontStyle.italic,
    color: Colors.green,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla Dividida'),
        backgroundColor: Colors.grey[200],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: const CustomDrawer(), 
      // Column divide la pantalla verticalmente.
      body: Column(
        children: <Widget>[
          
          _buildRowContainer(
            color: Colors.red[100]!,
            child: SizedBox(
              height: 50, // Altura limitada para forzar el desbordamiento.
              child: Marquee(
                text: 'Esta es la primera fila con fuente Google Fonts (Lato) y usa Marquee para desplazar el texto largo. ¡El paquete mejora la presentación!',
                style: _marqueeTextStyle,
                velocity: 50.0,
                pauseAfterRound: const Duration(seconds: 1),
                blankSpace: 20.0, 
              ),
            ),
          ),

          // Fila 2: Texto desbordado que se corta con puntos suspensivos
          _buildRowContainer(
            color: Colors.blue[100]!,
            child: Text(
              'Esta es la segunda fila con una fuente monoespaciada. El texto se corta con puntos suspensivos al final (TextOverflow.ellipsis).',
              style: _systemTextStyle,
              overflow: TextOverflow.ellipsis, 
              maxLines: 1, 
            ),
          ),

          // Fila 3: Texto desbordado que se corta sin avisar
          _buildRowContainer(
            color: Colors.green[100]!,
            child: Text(
              'Esta es la tercera fila con una fuente con serifa. El texto simplemente se corta (TextOverflow.clip) al final del contenedor.',
              style: _genericTextStyle,
              overflow: TextOverflow.clip, 
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  // Widget auxiliar: Usa Expanded para que las 3 filas tengan el mismo tamaño.
  Widget _buildRowContainer({required Color color, required Widget child}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        color: color,
        alignment: Alignment.centerLeft,
        child: child,
      ),
    );
  }
}