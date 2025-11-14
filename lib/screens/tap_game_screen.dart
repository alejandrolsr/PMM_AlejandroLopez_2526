import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import '../drawer/custom_drawer.dart';

class TapGameScreen extends StatefulWidget {
  
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
  final int _gameTimeInSeconds = 2; // Tiempo para pulsar 

  // Variable para evitar que el timer se active antes de que el layout esté listo
  bool _isLayoutBuilt = false; 

  @override
  void initState() {
    super.initState();
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
         _isLayoutBuilt = true;
      });
      // Inicia el timer aquí para que no se ejecute antes de tiempo
      _timer = Timer(Duration.zero, _moveTarget);
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Detenemos el timer al salir
    super.dispose();
  }

  void _startTimer() {
    // Si el timer ya existe, lo cancela
    if (mounted && _timer.isActive) _timer.cancel();
    // Inicia un nuevo timer
    _timer = Timer(Duration(seconds: _gameTimeInSeconds), _onMiss);
  }

  // Mueve el objetivo a una nueva posición aleatoria
  void _moveTarget() {
    if (!_isLayoutBuilt || !mounted) return; 

    // Obtenemos las dimensiones de la pantalla
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Altura del AppBar y padding superior para no poner la imagen fuera de la pantalla
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

  // El usuario pulsa a tiempo
  void _onTapTarget() {
    setState(() {
      _points++;
    });
    _moveTarget(); // Muestra el siguiente objetivo
  }

  // El timer se acabó, el usuario no pulsó
  void _onMiss() {
    // Solo actualiza si el widget sigue montado
    if (mounted) {
      setState(() {
        _points -= 2;
      });
      _moveTarget(); // Muestra el siguiente objetivo
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Puntos: $_points'),
      ),
      drawer: const CustomDrawer(),
      body: Stack( 
        children: [
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              onTap: _onTapTarget,
              child: Image.asset(
                'assets/images/logomalaga.png',
                width: 80,
                height: 80,
                errorBuilder: (context, error, stackTrace) {
                  //Icono Error por si no carga la imagen
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