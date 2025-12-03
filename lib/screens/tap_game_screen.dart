import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
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
  final int _gameTimeInSeconds = 2; 

  bool _isLayoutBuilt = false; 

  @override
  void initState() {
    super.initState();
    
    
    _loadPoints();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isLayoutBuilt = true;
      });
      _timer = Timer(Duration.zero, _moveTarget);
    });
  }

  // --- MÉTODOS DE PERSISTENCIA ---

  Future<void> _loadPoints() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _points = prefs.getInt('tap_game_points') ?? 0;
    });
  }

  Future<void> _savePoints() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('tap_game_points', _points);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    if (mounted && _timer.isActive) _timer.cancel();
    _timer = Timer(Duration(seconds: _gameTimeInSeconds), _onMiss);
  }

  void _moveTarget() {
    if (!_isLayoutBuilt || !mounted) return; 

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    final appBarHeight = AppBar().preferredSize.height;
    final topPadding = MediaQuery.of(context).padding.top;

    setState(() {
      _top = _random.nextDouble() * (screenHeight - appBarHeight - topPadding - 80) + (appBarHeight + topPadding); 
      _left = _random.nextDouble() * (screenWidth - 80);
    });

    _startTimer();
  }

  void _onTapTarget() {
    setState(() {
      _points++;
    });
    _savePoints();
    _moveTarget();
  }

  void _onMiss() {
    if (mounted) {
      setState(() {
        _points -= 2;
      });
      _savePoints(); 
      _moveTarget();
    }
  }

  //Función para reiniciar el juego
  void _resetGame() {
    setState(() {
      _points = 0;
    });
    _savePoints(); 
    _moveTarget(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Puntos: $_points'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Reiniciar Puntos',
            onPressed: _resetGame,
          ),
        ],
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
                  return Container(
                    width: 80,
                    height: 80,
                    color: Colors.red,
                    child: const Icon(Icons.error, color: Colors.white),
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