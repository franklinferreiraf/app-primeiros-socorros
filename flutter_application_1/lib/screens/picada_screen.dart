import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PicadaAnimalScreen extends StatelessWidget {
  const PicadaAnimalScreen({super.key});

  void _ligarParaSamu() async {
    final Uri url = Uri(scheme: 'tel', path: '75991964091');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Picada de Animal',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFFFEBEE),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.warning_amber_rounded, color: Colors.red.shade800),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Picadas de animais peçonhentos (cobras, escorpiões, aranhas) requerem atendimento médico URGENTE!",
                      style: TextStyle(
                        color: Colors.red.shade900,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "Primeiros socorros para picadas",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            ExpandableStepCard(
              number: "1",
              title: "Mantenha a calma",
              description:
                  "Acalme a vítima e evite movimentos bruscos. Movimento aumenta a circulação do veneno.",
              imagePath: "assets/images/picada_1.png",
              themeColor: Colors.orange,
            ),
            ExpandableStepCard(
              number: "2",
              title: "Lave com água e sabão",
              description:
                  "Lave bem o local da picada com água corrente e sabão neutro para remover sujeira e veneno superficial.",
              imagePath: "assets/images/picada_2.png",
              themeColor: Colors.orange,
            ),
            ExpandableStepCard(
              number: "3",
              title: "Imobilize o membro",
              description:
                  "Mantenha o membro afetado imóvel e no mesmo nível do coração (ou um pouco abaixo). Use tala improvisada se necessário.",
              imagePath: "assets/images/picada_3.png",
              themeColor: Colors.orange,
            ),
            ExpandableStepCard(
              number: "4",
              title: "Remova acessórios",
              description:
                  "Tire anéis, pulseiras, relógios e sapatos antes que o local inche.",
              imagePath: "assets/images/picada_4.png",
              themeColor: Colors.orange,
            ),
            ExpandableStepCard(
              number: "5",
              title: "Identifique o animal (se possível)",
              description:
                  "Se puder fazer com segurança, tente identificar ou fotografar o animal. Isso ajuda na escolha do soro correto. NUNCA se aproxime ou tente capturar o animal.",
              imagePath: "assets/images/picada_5.png",
              themeColor: Colors.orange,
            ),
            ExpandableStepCard(
              number: "6",
              title: "Busque atendimento médico URGENTE",
              description:
                  "Ligue para o SAMU (192) imediatamente. O soro antiveneno deve ser aplicado o quanto antes.",
              imagePath: "assets/images/picada_6.png",
              themeColor: Colors.orange,
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFFEBEE),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.close, color: Colors.red, size: 24),
                      const SizedBox(width: 8),
                      Text(
                        "O que NÃO fazer",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red.shade900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  _buildBulletPoint("NÃO faça torniquete ou garrote",
                      color: Colors.red.shade800),
                  _buildBulletPoint("NÃO corte ou perfure o local da picada",
                      color: Colors.red.shade800),
                  _buildBulletPoint("NÃO tente sugar o veneno com a boca",
                      color: Colors.red.shade800),
                  _buildBulletPoint(
                      "NÃO aplique gelo, folhas, pó de café ou outros produtos",
                      color: Colors.red.shade800),
                  _buildBulletPoint("NÃO dê bebidas alcoólicas à vítima",
                      color: Colors.red.shade800),
                  _buildBulletPoint("NÃO tente capturar ou matar o animal",
                      color: Colors.red.shade800),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8E1),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.orange.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.pets, color: Colors.orange.shade900, size: 24),
                      const SizedBox(width: 8),
                      Text(
                        "Animais peçonhentos comuns no Brasil",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text("Cobras",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange.shade900)),
                  Text(
                      "Jararaca, cascavel, coral, surucucu. Sintomas: dor, inchaço, sangramento",
                      style:
                          TextStyle(color: Colors.grey.shade800, fontSize: 13)),
                  const SizedBox(height: 10),
                  Text("Escorpiões",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange.shade900)),
                  Text(
                      "Amarelo e marrom. Sintomas: dor intensa, formigamento, suor",
                      style:
                          TextStyle(color: Colors.grey.shade800, fontSize: 13)),
                  const SizedBox(height: 10),
                  Text("Aranhas",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange.shade900)),
                  Text(
                      "Armadeira, viúva-negra, marrom. Sintomas: dor, inchaço, ferida",
                      style:
                          TextStyle(color: Colors.grey.shade800, fontSize: 13)),
                  const SizedBox(height: 10),
                  Text("Abelhas e vespas",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange.shade900)),
                  Text(
                      "Sintomas: dor, inchaço. Atenção: reação alérgica pode ser grave",
                      style:
                          TextStyle(color: Colors.grey.shade800, fontSize: 13)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.medical_services,
                          color: Colors.green.shade800, size: 24),
                      const SizedBox(width: 8),
                      Text(
                        "Sinais de gravidade",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text("Ligue para o SAMU imediatamente se houver:",
                      style: TextStyle(
                          color: Colors.green.shade800,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(height: 10),
                  _buildBulletPoint("Dificuldade para respirar ou engolir",
                      color: Colors.green.shade800),
                  _buildBulletPoint("Inchaço rápido e progressivo",
                      color: Colors.green.shade800),
                  _buildBulletPoint("Sangramento que não para",
                      color: Colors.green.shade800),
                  _buildBulletPoint("Visão turva ou dupla",
                      color: Colors.green.shade800),
                  _buildBulletPoint("Fraqueza muscular intensa",
                      color: Colors.green.shade800),
                  _buildBulletPoint("Vômitos ou diarreia",
                      color: Colors.green.shade800),
                  _buildBulletPoint("Febre alta", color: Colors.green.shade800),
                  _buildBulletPoint("Alteração da consciência",
                      color: Colors.green.shade800),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.pest_control,
                          color: Colors.blueGrey.shade800, size: 24),
                      const SizedBox(width: 8),
                      Text(
                        "Picada de abelha ou vespa",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Remova o ferrão raspando com unha ou cartão (não puxe com pinça). Lave com água e sabão, aplique gelo e pomada anti-histamínica.",
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.warning,
                          color: Colors.orange.shade800, size: 16),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          "Se houver múltiplas picadas ou sinais de alergia grave (dificuldade para respirar, inchaço da boca/garganta), chame o SAMU!",
                          style: TextStyle(
                              color: Colors.orange.shade900,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Picada de animal peçonhento?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.red.shade900,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Ligue IMEDIATAMENTE para o SAMU - tempo é essencial!",
                    style: TextStyle(color: Colors.red.shade700, fontSize: 13),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD32F2F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: _ligarParaSamu,
                      icon:
                          const Icon(Icons.phone_in_talk, color: Colors.white),
                      label: const Text(
                        "Ligar para SAMU 192",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text, {required Color color}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("•", style: TextStyle(color: color, fontSize: 18, height: 1)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: color, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpandableStepCard extends StatefulWidget {
  final String number;
  final String title;
  final String description;
  final String? imagePath;
  final Color themeColor;

  const ExpandableStepCard({
    super.key,
    required this.number,
    required this.title,
    required this.description,
    this.imagePath,
    required this.themeColor,
  });

  @override
  State<ExpandableStepCard> createState() => _ExpandableStepCardState();
}

class _ExpandableStepCardState extends State<ExpandableStepCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: widget.themeColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      widget.number,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black87),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.description,
                        style:
                            const TextStyle(color: Colors.black54, height: 1.4),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (widget.imagePath != null) ...[
              const SizedBox(height: 12),
              Divider(color: Colors.grey.shade100),
              InkWell(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _isExpanded ? "Ocultar ilustração" : "Ver ilustração",
                        style: TextStyle(
                            color: widget.themeColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        _isExpanded
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        color: widget.themeColor,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
              if (_isExpanded)
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade200),
                    color: Colors.white,
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    widget.imagePath!,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Text(
                            "Imagem não encontrada: ${widget.imagePath}",
                            style: const TextStyle(
                                color: Colors.red, fontSize: 12),
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
