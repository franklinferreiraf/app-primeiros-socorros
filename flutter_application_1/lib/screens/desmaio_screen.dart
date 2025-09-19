import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DesmaioScreen extends StatelessWidget {
  const DesmaioScreen({super.key});

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
              'Desmaio',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            Image.network(
              'https://i.imgur.com/2YjAV8G.png',
              height: 150,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.airline_seat_flat,
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
              'Deite a pessoa de costas em um local seguro e arejado.',
            ),
            _buildInstructionStep(
              '2',
              'Eleve as pernas da pessoa acima do nível do coração (cerca de 30 cm). Isso ajuda o sangue a voltar para o cérebro.',
            ),
            _buildInstructionStep(
              '3',
              'Afrouxe roupas apertadas, como cintos, gravatas e colarinhos.',
            ),
            _buildInstructionStep(
              '4',
              'Verifique se a pessoa está respirando. Ela deve recuperar a consciência em cerca de um minuto.',
            ),
            _buildInstructionStep(
              '5',
              'Se a pessoa não acordar, não estiver respirando ou tiver se machucado na queda, ligue para o SAMU (192) imediatamente.',
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
