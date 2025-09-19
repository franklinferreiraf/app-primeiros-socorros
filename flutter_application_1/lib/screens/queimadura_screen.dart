import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class QueimaduraScreen extends StatelessWidget {
  const QueimaduraScreen({super.key});

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
      appBar: AppBar(
        title: const Text(
          'Primeiros Socorros',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Queimadura',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            Image.network(
              'https://i.imgur.com/gBGMn5Q.png',
              height: 150,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.local_fire_department,
                size: 150,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),

            const Text(
              'Instruções',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            _buildInstructionStep(
              '1',
              'Resfrie a área afetada colocando-a sob água corrente fria (não gelada) por pelo menos 10 a 15 minutos.',
            ),
            _buildInstructionStep(
              '2',
              'NUNCA aplique gelo, pasta de dente, manteiga, pó de café ou qualquer outra receita caseira na queimadura. Isso pode piorar a lesão.',
            ),
            _buildInstructionStep(
              '3',
              'Após resfriar, cubra a área com um pano limpo e úmido ou com plástico filme (sem apertar).',
            ),
            _buildInstructionStep(
              '4',
              'Não estoure as bolhas, pois elas protegem a pele que está se regenerando por baixo.',
            ),
            _buildInstructionStep(
              '5',
              'Ligue para o SAMU (192) se a queimadura for grande (maior que a palma da mão), profunda, ou em áreas sensíveis como rosto, mãos e pés.',
            ),
            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _ligarParaSamu,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Ligar para o SAMU',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionStep(String number, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: Colors.grey[300],
            child: Text(
              number,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}
