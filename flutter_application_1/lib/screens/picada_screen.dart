import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PicadaAnimalScreen extends StatelessWidget {
  const PicadaAnimalScreen({super.key});

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
              'Picada de Animal',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            Image.network(
              'https://i.imgur.com/8d6xJgE.png',
              height: 150,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.pest_control, size: 150, color: Colors.grey),
            ),
            const SizedBox(height: 30),

            const Text(
              'Instruções',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            _buildInstructionStep(
              '1',
              'Lave o local da picada com água e sabão para limpar a ferida e reduzir o risco de infecção.',
            ),
            _buildInstructionStep(
              '2',
              'Aplique uma compressa fria (um pano molhado com água fria ou gelo envolto em um pano) sobre a área para ajudar a reduzir o inchaço e a dor.',
            ),
            _buildInstructionStep(
              '3',
              'Evite coçar, esfregar ou espremer o local da picada, pois isso pode piorar a irritação e espalhar o veneno, se houver.',
            ),
            _buildInstructionStep(
              '4',
              'Mantenha a pessoa calma e em repouso. Se a picada for em um braço ou perna, tente mantê-lo elevado.',
            ),
            _buildInstructionStep(
              '5',
              'Procure atendimento médico imediatamente, especialmente se não souber que animal causou a picada, se for picada de cobra, escorpião, aranha ou se a pessoa apresentar reações alérgicas (inchaço no rosto, dificuldade para respirar).',
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
