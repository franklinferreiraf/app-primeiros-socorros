import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CorteScreen extends StatelessWidget {
  const CorteScreen({super.key});

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
          'Corte',
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
                      "Cortes profundos com sangramento intenso requerem atendimento médico urgente!",
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
              "Como tratar cortes e sangramentos",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            ExpandableStepCard(
              number: "1",
              title: "Lave as mãos",
              description:
                  "Antes de tocar no ferimento, lave bem as mãos com água e sabão para evitar infecção.",
              imagePath: "assets/images/corte_1.png",
              themeColor: const Color(0xFFD32F2F),
            ),
            ExpandableStepCard(
              number: "2",
              title: "Limpe o ferimento",
              description:
                  "Lave o corte com água corrente limpa ou soro fisiológico. Remova sujeira visível com cuidado.",
              imagePath: "assets/images/corte_2.png",
              themeColor: const Color(0xFFD32F2F),
            ),
            ExpandableStepCard(
              number: "3",
              title: "Faça pressão direta",
              description:
                  "Use um pano limpo ou gaze e pressione firmemente sobre o corte por 5-10 minutos. Não tire para verificar, pois isso atrapalha a coagulação.",
              imagePath: "assets/images/corte_3.png",
              themeColor: const Color(0xFFD32F2F),
            ),
            ExpandableStepCard(
              number: "4",
              title: "Eleve o membro (se possível)",
              description:
                  "Se o corte for em braço ou perna, eleve o membro acima do nível do coração para reduzir o sangramento.",
              imagePath: "assets/images/corte_4.png",
              themeColor: const Color(0xFFD32F2F),
            ),
            ExpandableStepCard(
              number: "5",
              title: "Aplique curativo",
              description:
                  "Quando o sangramento parar, aplique pomada antibiótica (se disponível) e cubra com bandagem ou curativo adesivo limpo.",
              imagePath: "assets/images/corte_5.png",
              themeColor: const Color(0xFFD32F2F),
            ),
            ExpandableStepCard(
              number: "6",
              title: "Troque o curativo",
              description:
                  "Troque o curativo diariamente ou sempre que ficar sujo ou molhado. Observe sinais de infecção.",
              imagePath: "assets/images/corte_6.png",
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
                      Icon(Icons.water_drop,
                          color: Colors.red.shade800, size: 24),
                      const SizedBox(width: 8),
                      Text(
                        "Sangramento intenso",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red.shade900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Se o sangramento não parar após 10 minutos de pressão:",
                    style: TextStyle(
                        color: Colors.red.shade900,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  _buildBulletPoint("Continue fazendo pressão firme no local",
                      color: Colors.red.shade800),
                  _buildBulletPoint(
                      "Não remova o pano, adicione mais por cima se necessário",
                      color: Colors.red.shade800),
                  _buildBulletPoint("Mantenha o membro elevado",
                      color: Colors.red.shade800),
                  _buildBulletPoint("Chame o SAMU imediatamente",
                      color: Colors.red.shade800),
                  _buildBulletPoint(
                      "Se possível, faça pressão em ponto arterial (entre ferimento e coração)",
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
                      Icon(Icons.close,
                          color: Colors.orange.shade900, size: 24),
                      const SizedBox(width: 8),
                      Text(
                        "O que NÃO fazer",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange.shade900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  _buildBulletPoint(
                      "Não use torniquete (exceto em sangramento que ameace a vida)",
                      color: Colors.orange.shade900),
                  _buildBulletPoint(
                      "Não remova objetos grandes cravados no ferimento",
                      color: Colors.orange.shade900),
                  _buildBulletPoint(
                      "Não aplique açúcar, pó de café ou outros produtos caseiros",
                      color: Colors.orange.shade900),
                  _buildBulletPoint("Não sopre sobre o ferimento",
                      color: Colors.orange.shade900),
                  _buildBulletPoint(
                      "Não use álcool ou iodo diretamente na ferida aberta",
                      color: Colors.orange.shade900),
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
                      "O sangramento não parar após 10 minutos de pressão",
                      color: Colors.green.shade800),
                  _buildBulletPoint(
                      "O corte for profundo (expõe músculo, osso ou gordura)",
                      color: Colors.green.shade800),
                  _buildBulletPoint("Houver objeto cravado no ferimento",
                      color: Colors.green.shade800),
                  _buildBulletPoint(
                      "O corte for no rosto, pescoço ou articulação",
                      color: Colors.green.shade800),
                  _buildBulletPoint(
                      "A pessoa mostrar sinais de choque (palidez, sudorese, fraqueza)",
                      color: Colors.green.shade800),
                  _buildBulletPoint(
                      "Houver sinais de infecção (vermelhidão, inchaço, pus, febre)",
                      color: Colors.green.shade800),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.vaccines,
                          color: Colors.blue.shade800, size: 24),
                      const SizedBox(width: 8),
                      Text(
                        "Importante",
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
                    "Verifique se a vacina antitetânica está em dia, especialmente em cortes com objetos enferrujados ou sujos. A vacina protege contra o tétano.",
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 14),
                  ),
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
                    "Sangramento grave?",
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
