import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class QueimaduraScreen extends StatelessWidget {
  const QueimaduraScreen({super.key});

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
          'Queimadura',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFD32F2F),
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
                color: const Color(0xFFFFF3E0),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.orange.shade300),
              ),
              child: Row(
                children: [
                  Icon(Icons.warning_amber_rounded,
                      color: Colors.orange.shade800),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Queimaduras graves (grandes áreas, bolhas, pele carbonizada) requerem atendimento médico urgente!",
                      style: TextStyle(
                        color: Colors.orange.shade900,
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
              "Primeiros socorros para queimaduras",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            ExpandableStepCard(
              number: "1",
              title: "Afaste a fonte de calor",
              description:
                  "Remova a pessoa ou o objeto quente imediatamente. Se a roupa estiver em chamas, faça a pessoa rolar no chão.",
              imagePath: "assets/images/queimadura_1.png",
              themeColor: const Color(0xFFD32F2F),
            ),
            ExpandableStepCard(
              number: "2",
              title: "Resfrie com água corrente",
              description:
                  "Coloque a área queimada sob água corrente fria (não gelada) por 10-20 minutos. Isso reduz a dor e evita que a queimadura se aprofunde.",
              imagePath: "assets/images/queimadura_2.png",
              themeColor: const Color(0xFFD32F2F),
            ),
            ExpandableStepCard(
              number: "3",
              title: "Remova acessórios",
              description:
                  "Tire anéis, pulseiras, relógio e roupas soltas da área queimada antes que inche. Não remova roupas grudadas na pele.",
              imagePath: "assets/images/queimadura_3.png",
              themeColor: const Color(0xFFD32F2F),
            ),
            ExpandableStepCard(
              number: "4",
              title: "Cubra com pano limpo",
              description:
                  "Cubra a queimadura com um pano limpo e úmido ou gaze estéril. Não use algodão diretamente sobre a ferida.",
              imagePath: "assets/images/queimadura_4.png",
              themeColor: const Color(0xFFD32F2F),
            ),
            ExpandableStepCard(
              number: "5",
              title: "Não estoure bolhas",
              description:
                  "Se houver bolhas, não as estoure. Elas protegem a área queimada contra infecções.",
              imagePath: "assets/images/queimadura_5.png",
              themeColor: const Color(0xFFD32F2F),
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
                  _buildBulletPoint(
                      "Não aplique pasta de dente, manteiga, ovo ou qualquer produto caseiro",
                      color: Colors.red.shade800),
                  _buildBulletPoint("Não use gelo diretamente na queimadura",
                      color: Colors.red.shade800),
                  _buildBulletPoint("Não estoure bolhas",
                      color: Colors.red.shade800),
                  _buildBulletPoint("Não retire roupas grudadas na pele",
                      color: Colors.red.shade800),
                  _buildBulletPoint(
                      "Não use algodão diretamente sobre a ferida",
                      color: Colors.red.shade800),
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
                      Icon(Icons.local_fire_department,
                          color: Colors.green.shade800, size: 24),
                      const SizedBox(width: 8),
                      Text(
                        "Tipos de queimadura",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text("1º Grau (Leve)",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade900)),
                  Text("Pele vermelha, sem bolhas. Ex: queimadura de sol",
                      style: TextStyle(
                          color: Colors.green.shade800, fontSize: 13)),
                  const SizedBox(height: 10),
                  Text("2º Grau (Moderada)",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade900)),
                  Text("Pele vermelha com bolhas. Muito dolorosa",
                      style: TextStyle(
                          color: Colors.green.shade800, fontSize: 13)),
                  const SizedBox(height: 10),
                  Text("3º Grau (Grave)",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade900)),
                  Text(
                      "Pele carbonizada ou esbranquiçada. Pode não doer (nervos danificados). Requer SAMU!",
                      style: TextStyle(
                          color: Colors.green.shade800, fontSize: 13)),
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
                      Icon(Icons.phone_in_talk,
                          color: Colors.orange.shade900, size: 24),
                      const SizedBox(width: 8),
                      Text(
                        "Ligue para o SAMU se:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange.shade900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  _buildBulletPoint("A queimadura for maior que a palma da mão",
                      color: Colors.orange.shade900),
                  _buildBulletPoint(
                      "Atingir rosto, mãos, pés, genitais ou articulações",
                      color: Colors.orange.shade900),
                  _buildBulletPoint("For de 3º grau (pele carbonizada)",
                      color: Colors.orange.shade900),
                  _buildBulletPoint(
                      "For causada por eletricidade ou produtos químicos",
                      color: Colors.orange.shade900),
                  _buildBulletPoint(
                      "A vítima for criança, idoso ou tiver doenças crônicas",
                      color: Colors.orange.shade900),
                ],
              ),
            ),
            const SizedBox(height: 30),
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
                    "Queimadura grave?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.red.shade900,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Ligue imediatamente para o SAMU",
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
          Icon(Icons.circle, size: 8, color: color),
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
