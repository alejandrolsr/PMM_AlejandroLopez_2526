import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../drawer/custom_drawer.dart';

class InfoScreen extends StatelessWidget {
  static const String routeName = '/info';

  const InfoScreen({super.key});

  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://github.com/alejandrolsr/PMM_AlejandroLopez_2526');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'No se pudo lanzar $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Info")),
      drawer: const CustomDrawer(),
      
      body: Center(
      
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Alejandro López-Salvatierra Ruiz",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: _launchURL,
                child: const Text(
                  "https://github.com/alejandrolsr/PMM_AlejandroLopez_2526",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Courier',
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}