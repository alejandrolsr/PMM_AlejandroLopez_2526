import 'package:flutter/material.dart';
import '../screens/screens.dart';
import '../main.dart'; 

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    
    final appState = MyApp.of(context);

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
            leading: const Icon(Icons.home),
            title: const Text("Inicio"),
            onTap: () => Navigator.pushReplacementNamed(context, HomeScreen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Info"),
            onTap: () => Navigator.pushReplacementNamed(context, InfoScreen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text("Perfil"),
            onTap: () => Navigator.pushReplacementNamed(context, ProfileScreen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text("Galería"),
            onTap: () => Navigator.pushReplacementNamed(context, GalleryScreen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text("Iconos"),
            onTap: () => Navigator.pushReplacementNamed(context, IconsScreen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text("Imágenes"),
            onTap: () => Navigator.pushReplacementNamed(context, ImageGridScreen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text("Imágenes 2 "),
            onTap: () => Navigator.pushReplacementNamed(context, Images2Screen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.text_fields),
            title: const Text("Texto"),
            onTap: () => Navigator.pushReplacementNamed(context, TextScreen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.flag),
            title: const Text("Reto"),
            onTap: () => Navigator.pushReplacementNamed(context, ChallengeScreen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.touch_app),
            title: const Text("Contador de Clics"),
            onTap: () => Navigator.pushReplacementNamed(context, ContadorClickScreen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text("Instagram"),
            onTap: () => Navigator.pushReplacementNamed(context, InstagramScreen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.color_lens),
            title: const Text("Ramdom Colors"),
            onTap: () => Navigator.pushReplacementNamed(context, RandomColors.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.games),
            title: const Text("Tap Game"),
            onTap: () => Navigator.pushReplacementNamed(context, TapGameScreen.routeName),
          ),


          Divider(),
          SwitchListTile(
            title: Text('Modo Oscuro'),
            secondary: Icon(appState.currentThemeMode == ThemeMode.dark 
                ? Icons.dark_mode 
                : Icons.light_mode),
            
            value: appState.currentThemeMode == ThemeMode.dark,
            onChanged: (bool value) {
              appState.toggleTheme(value);
            },
          ),
        ],
      ),
    );
  }
}