import 'package:flutter/material.dart';

class StoryHighlights extends StatelessWidget {
  // Lista de historias
  final List<Map<String, String>> stories = [
    {'label': 'AUDI', 'imagePath': 'assets/images/ig/audi.jpg'},
    {'label': 'BMW', 'imagePath': 'assets/images/ig/bmw.jpg'},
    {'label': 'TESLA', 'imagePath': 'assets/images/ig/tesla.jpg'},
    {'label': 'MERCEDES', 'imagePath': 'assets/images/ig/mercedes.jpg'},
    {'label': 'PORSCHE', 'imagePath': 'assets/images/ig/porsche.png'},
    {'label': 'VOLVO', 'imagePath': 'assets/images/ig/volvo.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.0, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        itemCount: stories.length,
        itemBuilder: (context, index) {
          return _buildStoryItem(
            stories[index]['label']!,
            stories[index]['imagePath']!,
          );
        },
      ),
    );
  }

  //Widget para cada círculo de historia
  Widget _buildStoryItem(String label, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.grey[200], 
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}