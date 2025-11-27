import 'package:flutter/material.dart';
import 'dart:math';
import '../drawer/custom_drawer.dart';

class GuessNumberScreen extends StatefulWidget {
  static const String routeName = '/guess_number';

  const GuessNumberScreen({super.key});

  @override
  State<GuessNumberScreen> createState() => _GuessNumberScreenState();
}

class _GuessNumberScreenState extends State<GuessNumberScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  
  late int _targetNumber;
  String _message = '';
  Color _messageColor = Colors.black;
  bool _isGuessed = false;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    setState(() {
      _targetNumber = Random().nextInt(100) + 1;
      _message = 'Adivina el número entre 1 y 100';
      _messageColor = Colors.black;
      _isGuessed = false;
      _controller.clear();
    });
  }

  void _checkGuess() {
    if (_formKey.currentState!.validate()) {
      int guess = int.parse(_controller.text);
      setState(() {
        if (guess < _targetNumber) {
          _message = 'El número es MAYOR que $guess';
          _messageColor = Colors.orange;
        } else if (guess > _targetNumber) {
          _message = 'El número es MENOR que $guess';
          _messageColor = Colors.orange;
        } else {
          _message = '¡Correcto! El número era $_targetNumber';
          _messageColor = Colors.green;
          _isGuessed = true;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adivina el Número'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _startNewGame,
            tooltip: 'Reiniciar juego',
          )
        ],
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _message,
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold, 
                  color: _messageColor
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              if (!_isGuessed)
                TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Introduce tu número',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.numbers),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, introduce un número';
                    }
                    final n = int.tryParse(value);
                    if (n == null) {
                      return 'Debe ser un número válido';
                    }
                    if (n < 1 || n > 100) {
                      return 'El número debe estar entre 1 y 100';
                    }
                    return null;
                  },
                ),
              const SizedBox(height: 20),
              if (!_isGuessed)
                ElevatedButton(
                  onPressed: _checkGuess,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Comprobar'),
                ),
              if (_isGuessed)
                ElevatedButton.icon(
                  onPressed: _startNewGame,
                  icon: const Icon(Icons.replay),
                  label: const Text('Jugar otra vez'),
                )
            ],
          ),
        ),
      ),
    );
  }
}