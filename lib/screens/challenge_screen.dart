import 'package:flutter/material.dart';
import '../drawer/custom_drawer.dart'; 

class ChallengeScreen extends StatelessWidget {

  static const String routeName = '/challenge';

  const ChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Challenge'),
        backgroundColor: Colors.lightBlue,
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.lightBlue,
                width: 10,
              ),
            ),
            child: SizedBox(
              width: 280,
              height: 280,
              child: Center(
                child: const Text(
                  'H',
                  style: TextStyle(
                    fontSize: 180,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}