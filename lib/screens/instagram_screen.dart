import 'package:flutter/material.dart';

import '../widgets/profile_header.dart';
import '../widgets/action_buttons.dart';
import '../widgets/story_highlights.dart';
import '../widgets/post_grid.dart';

class InstagramScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, 
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            
            Navigator.pop(context);
          },
        ),
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
      ),
      body: ListView(
        // ListView para hacer la pantalla scrollable
        children: [
          ProfileHeader(),
          ActionButtons(),
          StoryHighlights(),

          // Separador antes de la cuadrícula
          Divider(height: 1), 
          
          PostGrid(),
        ],
      ),
    );
  }
}