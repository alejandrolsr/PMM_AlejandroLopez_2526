import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Center(
              child: Text(
                "Menú de Navegación",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Info"),
            onTap: () => Navigator.pushNamed(context, '/info'),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text("Perfil"),
            onTap: () => Navigator.pushNamed(context, '/profile'),
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text("Galería"),
            onTap: () => Navigator.pushNamed(context, '/gallery'),
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text("Iconos"),
            onTap: () => Navigator.pushNamed(context, '/icons'),
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text("Imágenes"),
            onTap: () => Navigator.pushNamed(context, '/images'),
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text("Imágenes 2 "),
            onTap: () => Navigator.pushNamed(context, '/images2'),
          ),
          ListTile(
            leading: const Icon(Icons.text_fields),
            title: const Text("Texto"),
            onTap: () => Navigator.pushNamed(context, '/text'),
          ),
          ListTile(
            leading: const Icon(Icons.flag),
            title: const Text("Reto"),
            onTap: () => Navigator.pushNamed(context, '/challenge'),
          ),
          ListTile(
            leading: const Icon(Icons.touch_app),
            title: const Text("Contador de Clics"),
            onTap: () => Navigator.pushNamed(context, '/contadorclick'),
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text("Instagram"),
            onTap: () => Navigator.pushNamed(context, '/instagram'),
          ),
          ListTile(
            leading: const Icon(Icons.color_lens),
            title: const Text("Ramdom Colors"),
            onTap: () => Navigator.pushNamed(context, '/randomcolors'),
          ),

                    ListTile(
            leading: const Icon(Icons.games),
            title: const Text("Tap Game"),
            onTap: () => Navigator.pushNamed(context, '/tapgame'),
          ),
        ],
      ),
    );
  }
}
