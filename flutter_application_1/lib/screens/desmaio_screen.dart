import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DesmaioScreen extends StatelessWidget {
  const DesmaioScreen({super.key});

  void _ligarParaSamu() async {
    final Uri url = Uri(scheme: 'tel', path: '75991964091');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Desmaio',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange.shade800,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
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
                      "Desmaio é a perda temporária de consciência. Mantenha a calma e siga os passos!",
                      style: TextStyle(
                        color: Colors.orange.shade900,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "Como agir em caso de desmaio",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            ExpandableStepCard(
              number: "1",
              title: "Deite a pessoa no chão",
              description:
                  "Coloque a pessoa deitada de costas em local seguro e afaste objetos que possam machucá-la.",
              imagePath: "assets/images/desmaio_1.png",
              themeColor: Colors.orange.shade800,
            ),
            ExpandableStepCard(
              number: "2",
              title: "Eleve as pernas",
              description:
                  "Levante as pernas da pessoa cerca de 30 cm do chão. Isso ajuda o sangue a voltar ao cérebro.",
              imagePath: "assets/images/desmaio_2.png",
              themeColor: Colors.orange.shade800,
            ),
            ExpandableStepCard(
              number: "3",
              title: "Afrouxe roupas apertadas",
              description:
                  "Solte gravatas, cintos, botões ou qualquer roupa que esteja apertando o pescoço ou peito.",
              imagePath: "assets/images/desmaio_3.png",
              themeColor: Colors.orange.shade800,
            ),
            ExpandableStepCard(
              number: "4",
              title: "Verifique a respiração",
              description:
                  "Observe se a pessoa está respirando normalmente. Se não estiver, chame ajuda imediatamente e inicie RCP se souber.",
              imagePath: "assets/images/desmaio_4.png",
              themeColor: Colors.orange.shade800,
            ),
            ExpandableStepCard(
              number: "5",
              title: "Aguarde a recuperação",
              description:
                  "A pessoa geralmente acorda em 1-2 minutos. Quando recuperar a consciência, deixe-a descansar por alguns minutos antes de se levantar.",
              imagePath: "assets/images/desmaio_5.png",
              themeColor: Colors.orange.shade800,
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
                      "Não dê água ou alimentos enquanto a pessoa estiver inconsciente",
                      color: Colors.red.shade800),
                  _buildBulletPoint("Não jogue água no rosto",
                      color: Colors.red.shade800),
                  _buildBulletPoint(
                      "Não tente fazer a pessoa sentar ou levantar imediatamente",
                      color: Colors.red.shade800),
                  _buildBulletPoint("Não dê tapas no rosto",
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
                      Icon(Icons.phone_in_talk,
                          color: Colors.green.shade800, size: 24),
                      const SizedBox(width: 8),
                      Text(
                        "Ligue para o SAMU se:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  _buildBulletPoint(
                      "A pessoa não recuperar a consciência em 2 minutos",
                      color: Colors.green.shade800,
                      icon: Icons.check_circle_outline),
                  _buildBulletPoint("Houver dificuldade para respirar",
                      color: Colors.green.shade800,
                      icon: Icons.check_circle_outline),
                  _buildBulletPoint("A pessoa se machucar ao cair",
                      color: Colors.green.shade800,
                      icon: Icons.check_circle_outline),
                  _buildBulletPoint("For idoso, diabético ou cardiopata",
                      color: Colors.green.shade800,
                      icon: Icons.check_circle_outline),
                  _buildBulletPoint("O desmaio se repetir",
                      color: Colors.green.shade800,
                      icon: Icons.check_circle_outline),
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
                    "Precisa de ajuda?",
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

  Widget _buildBulletPoint(String text,
      {required Color color, IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon ?? Icons.circle, size: 8, color: color),
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
