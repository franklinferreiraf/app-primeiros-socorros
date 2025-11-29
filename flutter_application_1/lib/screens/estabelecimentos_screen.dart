import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EstabelecimentosScreen extends StatelessWidget {
  const EstabelecimentosScreen({super.key});

  Future<void> _abrirMapa(String busca) async {
    final Uri url =
        Uri.parse("https://www.google.com/maps/search/?api=1&query=$busca");
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        debugPrint("Não foi possível abrir o mapa.");
      }
    } catch (e) {
      debugPrint("Erro ao abrir mapa: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32), // Verde Escuro
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Row(
          children: [
            Icon(Icons.location_on_outlined, color: Colors.white, size: 20),
            SizedBox(width: 8),
            Text(
              "Estabelecimentos Próximos",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  border: Border.all(color: Colors.green.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.pin_drop, color: Colors.green.shade800),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        "Encontre rapidamente os estabelecimentos de saúde mais próximos de você",
                        style: TextStyle(color: Colors.black87, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _EstablishmentCard(
                title: "Hospitais",
                subtitle: "Atendimento 24h para casos graves e emergências",
                icon: Icons.local_hospital,
                color: const Color(0xFFD32F2F),
                bgColor: const Color(0xFFFFEBEE),
                onTapMap: () => _abrirMapa("hospital pronto socorro"),
              ),
              _EstablishmentCard(
                title: "UPA - Unidade de Pronto Atendimento",
                subtitle: "Urgências e emergências de média complexidade",
                icon: Icons.business,
                color: const Color(0xFF2E7D32),
                bgColor: const Color(0xFFE8F5E9),
                onTapMap: () => _abrirMapa("UPA 24h"),
              ),
              _EstablishmentCard(
                title: "Farmácias 24h",
                subtitle: "Medicamentos e primeiros socorros",
                icon: Icons.medication,
                color: const Color(0xFFF57C00),
                bgColor: const Color(0xFFFFF3E0),
                onTapMap: () => _abrirMapa("farmacia 24 horas"),
              ),
              _EstablishmentCard(
                title: "Pronto Socorro",
                subtitle: "Atendimento emergencial imediato",
                icon: Icons.medical_services_outlined,
                color: const Color(0xFFD32F2F),
                bgColor: const Color(0xFFFFEBEE),
                onTapMap: () => _abrirMapa("pronto socorro"),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.lightbulb, color: Colors.amber, size: 24),
                        SizedBox(width: 8),
                        Text(
                          "Dicas importantes",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildBulletPoint(
                        "Sempre ligue para o SAMU (192) em casos graves"),
                    _buildBulletPoint(
                        "UPAs atendem urgências menos graves que hospitais"),
                    _buildBulletPoint(
                        "Farmácias 24h podem ajudar com orientações básicas"),
                    _buildBulletPoint("Tenha sempre seu cartão do SUS em mãos"),
                    _buildBulletPoint(
                        "Guarde o endereço do hospital mais próximo"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black54)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.black54, height: 1.3),
            ),
          ),
        ],
      ),
    );
  }
}

class _EstablishmentCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Color bgColor;
  final VoidCallback onTapMap;

  const _EstablishmentCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.bgColor,
    required this.onTapMap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: bgColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: color, size: 28),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black87),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: onTapMap,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.near_me, color: Colors.white, size: 18),
                  SizedBox(width: 8),
                  Text(
                    "Ver no Mapa",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
