import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'corte_screen.dart';
import 'desmaio_screen.dart';
import 'engasgo_screen.dart';
import 'picada_screen.dart';
import 'queimadura_screen.dart';

void main() {
  runApp(const PrimeirosSocorrosApp());
}

class PrimeirosSocorrosApp extends StatelessWidget {
  const PrimeirosSocorrosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _ligarParaSamu() async {
    final Uri url = Uri(scheme: 'tel', path: '192');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print('Não foi possível realizar a chamada para $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Primeiros Socorros",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildOption(
                context,
                Icons.person,
                "Engasgo",
                const EngasgoScreen(),
              ),
              _buildOption(
                context,
                Icons.bed,
                "Desmaio",
                const DesmaioScreen(),
              ),
              _buildOption(
                context,
                Icons.local_fire_department,
                "Queimadura",
                const QueimaduraScreen(),
              ),
              _buildOption(context, Icons.cut, "Corte", const CorteScreen()),
              _buildOption(
                context,
                Icons.pest_control,
                "Picada de Animal",
                const PicadaAnimalScreen(),
              ),

              const SizedBox(height: 20),

              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 40,
                  ),
                ),
                onPressed: _ligarParaSamu,
                icon: const Icon(Icons.local_phone, color: Colors.white),
                label: const Text(
                  "192",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(
    BuildContext context,
    IconData icon,
    String text,
    Widget screen,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue.shade50,
          foregroundColor: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: const Size(double.infinity, 50),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        icon: Icon(icon),
        label: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
