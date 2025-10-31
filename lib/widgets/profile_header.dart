import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              //Foto de perfil
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey[200],
                backgroundImage: AssetImage('assets/images/ig/fotoale.jpg'),
              ),
              
              //Estadísticas
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatColumn('9', 'Posts'),
                    _buildStatColumn('143 K', 'Followers'),
                    _buildStatColumn('854', 'Following'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),

          //Biografía
          Text('Alejandro López-Salvatierra', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Photographer/Videomaker', style: TextStyle(color: Colors.grey[600])),
          SizedBox(height: 8),
          Text(
            'Spain, Málaga 🇪🇸🏖️ \nFotógrafo de Coches 🚗\nContáctame: \nwww.alejandrosalvatierrafotomaker.com',
          ),
          SizedBox(height: 8),
          Text(
            'Followed by audi.es, bmw_espana and 18 others',
            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }

  //Widget para crear cada columna de estadística
  Column _buildStatColumn(String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}