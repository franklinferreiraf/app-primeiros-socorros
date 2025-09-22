import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CorteScreen extends StatelessWidget {
  const CorteScreen({super.key});

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
              'Corte',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'images/corte.png',
              height: 150,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.cut, size: 150, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            const Text(
              'Instruções',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildInstructionStep(
              '1',
              'Lave bem as mãos com água e sabão antes de tocar no ferimento para evitar infecções.',
            ),
            _buildInstructionStep(
              '2',
              'Estanque o sangramento pressionando a área com um pano limpo, gaze ou um curativo por alguns minutos.',
            ),
            _buildInstructionStep(
              '3',
              'Lave o corte com água corrente e sabão neutro ao redor. Evite usar produtos como álcool ou iodo diretamente na ferida, pois podem irritar a pele.',
            ),
            _buildInstructionStep(
              '4',
              'Seque a área com cuidado e aplique uma fina camada de pomada antibiótica, se tiver.',
            ),
            _buildInstructionStep(
              '5',
              'Cubra o corte com um curativo ou bandagem para mantê-lo limpo. Troque o curativo diariamente ou sempre que ficar sujo ou molhado.',
            ),
            _buildInstructionStep(
              '6',
              'Ligue para o SAMU (192) se o sangramento não parar, o corte for muito profundo, grande ou houver sinais de infecção (vermelhidão, inchaço, pus).',
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
