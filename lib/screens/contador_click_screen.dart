import 'package:flutter/material.dart';
import '../drawer/custom_drawer.dart';

class ContadorClickScreen extends StatefulWidget {
  static const String routeName = '/contadorclick';
  const ContadorClickScreen({super.key});

  @override
  State<ContadorClickScreen> createState() => _ContadorClickScreenState();
}

class _ContadorClickScreenState extends State<ContadorClickScreen> {
  int _veces = 0;

  void _incrementar() { setState(() { _veces++; }); }
  void _resetear() { setState(() { _veces = 0; }); }
  void _disminuir() { setState(() { _veces--; }); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Contador de clics')),
        backgroundColor: Colors.greenAccent,
      ),
      drawer: const CustomDrawer(),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Has pulsado: ', style: TextStyle(fontSize: 25)),
              Text(
                '$_veces ${(_veces == 1) ? 'vez' : 'veces'}',
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
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
    );
  }
}