import 'package:flutter/material.dart';
import '../widgets/profile_header.dart';
import '../widgets/action_buttons.dart';
import '../widgets/story_highlights.dart';
import '../widgets/post_grid.dart';
import '../drawer/custom_drawer.dart';

class InstagramScreen extends StatelessWidget {
  // <-- 2. AÑADIR LA RUTA ESTÁTICA
  static const String routeName = '/instagram';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(), 
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, 
        title: Row(
          children: [
            Text(
              'alejandrosalvatierra',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black, 
                fontSize: 18,
              ),
            ),
            SizedBox(width: 4),
            Icon(Icons.verified, color: Colors.blue, size: 18),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],

        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        actionsIconTheme: IconThemeData(color: Colors.black), 
      ),
      body: ListView(
        // ListView para hacer la pantalla scrollable
        children: [
          ProfileHeader(),
          ActionButtons(),
          StoryHighlights(),

          Divider(height: 1), 
          
          PostGrid(),
        ],
      ),
    );
  }
}