import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import '../drawer/custom_drawer.dart';

class TextScreen extends StatelessWidget {
  static const String routeName = '/text';

  const TextScreen({super.key});

  TextStyle get _marqueeTextStyle => GoogleFonts.lato(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.red[800],
      );

  final TextStyle _systemTextStyle = const TextStyle(
    fontSize: 26,
    fontFamily: 'RobotoMono',
    color: Colors.blue,
  );

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
        title: const Text('Pantalla Dividida Scrollable'),
        backgroundColor: Colors.grey[200],
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            
            _buildRowContainer(
              color: Colors.red[100]!,
              child: SizedBox(
                height: 50,
                child: Marquee(
                  text: 'Esta es la primera fila con fuente Google Fonts (Lato) y usa Marquee para desplazar el texto largo. ¡El paquete mejora la presentación!',
                  style: _marqueeTextStyle,
                  velocity: 50.0,
                  pauseAfterRound: const Duration(seconds: 1),
                  blankSpace: 20.0,
                ),
              ),
            ),

            _buildRowContainer(
              color: Colors.blue[100]!,
              child: Text(
                'Esta es la segunda fila con una fuente monoespaciada. El texto se corta con puntos suspensivos al final (TextOverflow.ellipsis).',
                style: _systemTextStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 2, // Permitimos un par de líneas antes de cortar
              ),
            ),

            _buildRowContainer(
              color: Colors.green[100]!,
              child: Text(
                'Esta es la tercera fila con una fuente con serifa. El texto simplemente se corta (TextOverflow.clip) al final del contenedor.',
                style: _genericTextStyle,
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Altura fija de 250 para asegurar que ocupe espacio y permita scroll
  Widget _buildRowContainer({required Color color, required Widget child}) {
    return Container(
      height: 250, 
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      color: color,
      alignment: Alignment.centerLeft,
      child: child,
    );
  }
}