import 'package:flutter/material.dart';
import '../drawer/custom_drawer.dart';

class FormScreen extends StatefulWidget {
  static const String routeName = '/form';

  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _likesSweets = false;
  bool _chocolate = false;
  bool _helado = false;
  bool _tarta = false;
  double _sugarLevel = 5.0;
  String _saltyPreference = 'Pizza';
  bool _wantsSpicy = false;

  @override
  void dispose() {
    // Limpiamos los controladores al salir de la pantalla
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulario Completo')),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre completo',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'El nombre es obligatorio';

                  final nameRegExp = RegExp(r'^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+$');
                  if (!nameRegExp.hasMatch(value)) {
                    return 'Introduce un nombre válido (solo letras)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'El correo es obligatorio';
                  
                  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegExp.hasMatch(value)) {
                    return 'Introduce un correo válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Teléfono',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'El teléfono es obligatorio';
                  
                  final phoneRegExp = RegExp(r'^[0-9]{9}$');
                  if (!phoneRegExp.hasMatch(value)) {
                    return 'El teléfono debe tener 9 dígitos numéricos';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              
              Card(
                elevation: 4,
                child: SwitchListTile(
                  title: const Text(
                    '¿Prefieres comida dulce?',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: Text(_likesSweets ? 'Sí, me encanta el azúcar' : 'No, prefiero lo salado'),
                  secondary: Icon(
                    _likesSweets ? Icons.cake : Icons.local_pizza,
                    color: _likesSweets ? Colors.pink : Colors.orange,
                    size: 30,
                  ),
                  value: _likesSweets,
                  onChanged: (bool value) {
                    setState(() {
                      _likesSweets = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Renderizado condicional según el Switch
              if (_likesSweets) ...[
                const Text("Opciones para golosos:", style: TextStyle(fontSize: 18, color: Colors.pink)),
                const SizedBox(height: 10),
                CheckboxListTile(
                  title: const Text("Chocolate"),
                  value: _chocolate,
                  activeColor: Colors.pink,
                  onChanged: (val) => setState(() => _chocolate = val!),
                ),
                CheckboxListTile(
                  title: const Text("Helado"),
                  value: _helado,
                  activeColor: Colors.pink,
                  onChanged: (val) => setState(() => _helado = val!),
                ),
                CheckboxListTile(
                  title: const Text("Tarta"),
                  value: _tarta,
                  activeColor: Colors.pink,
                  onChanged: (val) => setState(() => _tarta = val!),
                ),
                const SizedBox(height: 20),
                const Text("Nivel de azúcar deseado (1-10):"),
                Slider(
                  value: _sugarLevel,
                  min: 1,
                  max: 10,
                  divisions: 9,
                  label: _sugarLevel.round().toString(),
                  activeColor: Colors.pink,
                  onChanged: (val) => setState(() => _sugarLevel = val),
                ),
              ] else ...[
                const Text("Menú salado:", style: TextStyle(fontSize: 18, color: Colors.orange)),
                const SizedBox(height: 10),
                RadioListTile<String>(
                  title: const Text('Pizza'),
                  value: 'Pizza',
                  groupValue: _saltyPreference,
                  activeColor: Colors.orange,
                  onChanged: (val) => setState(() => _saltyPreference = val!),
                ),
                RadioListTile<String>(
                  title: const Text('Hamburguesa'),
                  value: 'Hamburguesa',
                  groupValue: _saltyPreference,
                  activeColor: Colors.orange,
                  onChanged: (val) => setState(() => _saltyPreference = val!),
                ),
                RadioListTile<String>(
                  title: const Text('Sushi'),
                  value: 'Sushi',
                  groupValue: _saltyPreference,
                  activeColor: Colors.orange,
                  onChanged: (val) => setState(() => _saltyPreference = val!),
                ),
                const SizedBox(height: 20),
                SwitchListTile(
                  title: const Text("¿Añadir picante?"),
                  value: _wantsSpicy,
                  activeTrackColor: Colors.red,
                  onChanged: (val) => setState(() => _wantsSpicy = val),
                ),
              ],
              
              const SizedBox(height: 30),
              
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                    
                      String tipoComida = _likesSweets ? 'Dulce' : 'Salado';
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Datos de ${_nameController.text} guardados. Preferencia: $tipoComida'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  },
                  child: const Text("Guardar Todo"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}