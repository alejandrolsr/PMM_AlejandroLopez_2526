import 'package:flutter/material.dart';

class ContadorClickScreen extends StatefulWidget {
  const ContadorClickScreen({super.key});

  @override
  State<ContadorClickScreen> createState() => _ContadorClickScreenState();
}

class _ContadorClickScreenState extends State<ContadorClickScreen> {
  int _veces = 0;

  void _incrementar() {
    setState(() {
      _veces++;
    });
  }

  void _resetear() {
    setState(() {
      _veces = 0;
    });
  }

  void _disminuir() {
    setState(() {
      _veces--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de clics',
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Contador de clics')),
          backgroundColor: Colors.greenAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('Has pulsado: ', style: TextStyle(fontSize: 25)),
            ),
            Center(
              child: Text(
                '$_veces ${(_veces == 1) ? 'vez' : 'veces'}',
                style: const TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: _resetear,
              tooltip: "Poner a cero",
              backgroundColor: Colors.redAccent,
              child: const Icon(Icons.refresh),
            ),
            const SizedBox(width: 10),

            FloatingActionButton(
              onPressed: _disminuir,
              tooltip: "Disminuir",
              backgroundColor: const Color.fromARGB(255, 246, 97, 28),
              child: const Icon(Icons.remove),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              onPressed: _incrementar,
              tooltip: "Incrementar",
              backgroundColor: Colors.greenAccent,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
