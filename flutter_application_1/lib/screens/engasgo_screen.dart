import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EngasgoScreen extends StatelessWidget {
  const EngasgoScreen({super.key});

  // Função para fazer a ligação de emergência
  void _ligarParaSamu() async {
    final Uri url = Uri(scheme: 'tel', path: '192');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      // Idealmente, aqui você mostraria um erro para o usuário
      // com um AlertDialog ou SnackBar.
      print('Não foi possível realizar a chamada para $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: const Text(
          'Primeiros Socorros',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
        // Adiciona o ícone de seta para voltar com a cor branca
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // Permite a rolagem da tela em dispositivos menores
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Título da página
            const Text(
              'Engasgo',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Imagem representativa
            // SUBSTITUA 'assets/engasgo_icon.png' pelo caminho da sua imagem
            Image.asset(
              'images/engasgo.png',
              height: 150,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.person_off, size: 150, color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // Subtítulo de Instruções
            const Text(
              'Instruções',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Passos das instruções
            _buildInstructionStep(
              '1',
              'Incentive a pessoa a tossir com força. A tosse é a forma mais eficaz de expelir o objeto.',
            ),
            _buildInstructionStep(
              '2',
              'Se a pessoa não conseguir tossir, aplique 5 pancadas firmes no meio das costas, entre as omoplatas, usando a base da sua mão.',
            ),
            _buildInstructionStep(
              '3',
              'Se as pancadas não funcionarem, realize a "Manobra de Heimlich": posicione-se por trás da pessoa, abrace-a na altura do umbigo e faça compressões rápidas para dentro e para cima.',
            ),
            _buildInstructionStep(
              '4',
              'Alterne entre 5 pancadas nas costas e 5 compressões abdominais até o objeto ser expelido.',
            ),
            _buildInstructionStep(
              '5',
              'Se a pessoa desmaiar, ligue imediatamente para o SAMU (192) e inicie a massagem cardíaca, se souber como fazer.',
            ),
            const SizedBox(height: 40),

            // Botão para ligar para emergência
            SizedBox(
              width: double.infinity, // Faz o botão ocupar toda a largura
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

  // Widget auxiliar para criar cada passo da instrução
  Widget _buildInstructionStep(String number, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Círculo com o número do passo
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
          // Texto da instrução
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
