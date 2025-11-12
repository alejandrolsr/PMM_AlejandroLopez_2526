import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import '../drawer/custom_drawer.dart';

class TapGameScreen extends StatefulWidget {
  // 1. Añadimos la ruta nombrada
  static const String routeName = '/tapgame';

  const TapGameScreen({super.key});

  @override
  State<TapGameScreen> createState() => _TapGameScreenState();
}

class _TapGameScreenState extends State<TapGameScreen> {
  int _points = 0;
  double _top = 0;
  double _left = 0;
  final Random _random = Random();
  late Timer _timer;
  final int _gameTimeInSeconds = 2; // Tiempo para pulsar (puedes cambiarlo)

  // Variable para evitar que el timer se active antes de que el layout esté listo
  bool _isLayoutBuilt = false; 

  @override
  void initState() {
    super.initState();
    // Espera a que el primer frame se dibuje para obtener el tamaño de la pantalla
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
         _isLayoutBuilt = true;
      });
      _moveTarget(); // Coloca el primer objetivo y empieza el timer
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Detenemos el timer al salir
    super.dispose();
  }

  void _startTimer() {
    // Si el timer ya existe, lo cancela
    if (_timer.isActive) _timer.cancel();
    // Inicia un nuevo timer
    _timer = Timer(Duration(seconds: _gameTimeInSeconds), _onMiss);
  }

  // Mueve el objetivo a una nueva posición aleatoria
  void _moveTarget() {
    if (!_isLayoutBuilt) return; // No hace nada si el layout no está listo

    // Obtenemos las dimensiones de la pantalla
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Altura del AppBar y padding superior para no poner la imagen "debajo"
    final appBarHeight = AppBar().preferredSize.height;
    final topPadding = MediaQuery.of(context).padding.top;

    setState(() {
      // Genera posiciones aleatorias, asegurando que la imagen quepa
      // Restamos 80 (tamaño de la imagen) y el espacio del AppBar
      _top = _random.nextDouble() * (screenHeight - appBarHeight - topPadding - 80) + (appBarHeight + topPadding); 
      _left = _random.nextDouble() * (screenWidth - 80);
    });

    // Reinicia el timer para el nuevo objetivo
    _startTimer();
  }

  // El usuario pulsó a tiempo
  void _onTapTarget() {
    setState(() {
      _points++;
    });
    _moveTarget(); // Muestra el siguiente objetivo
  }

  // El timer se acabó, el usuario no pulsó
  void _onMiss() {
    setState(() {
      _points -= 2;
    });
    _moveTarget(); // Muestra el siguiente objetivo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Puntos: $_points'),
      ),
      // 2. Añadimos el Drawer
      drawer: const CustomDrawer(),
      body: Stack( // Stack nos permite posicionar elementos libremente
        children: [
          // 3. El objetivo (imagen) posicionado
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              onTap: _onTapTarget,
              child: Image.asset(
                'assets/images/target.png', // <-- ¡CAMBIA ESTO SI TU IMAGEN SE LLAMA DIFERENTE!
                width: 80,
                height: 80,
                errorBuilder: (context, error, stackTrace) {
                  // Plan B por si la imagen no carga
                  return Container(
                    width: 80,
                    height: 80,
                    color: Colors.red,
                    child: Icon(Icons.error, color: Colors.white),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}