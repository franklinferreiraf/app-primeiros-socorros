import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RcpScreen extends StatelessWidget {
  const RcpScreen({super.key});

  void _ligarParaSamu() async {
    final Uri url = Uri(scheme: 'tel', path: '192');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: const Color(0xFFD32F2F),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "RCP - Reanimação Cardiopulmonar",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFEBEE),
                  border: Border.all(color: Colors.red.shade200),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.warning_amber_rounded, color: Colors.red),
                    const SizedBox(width: 10),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(color: Colors.black87, fontSize: 13),
                          children: [
                            TextSpan(
                                text:
                                    "RCP é usado em casos de PARADA CARDÍACA. Ligue "),
                            TextSpan(
                              text: "192 IMEDIATAMENTE",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: " antes de iniciar!"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Como fazer RCP (Reanimação Cardiopulmonar)",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              const SizedBox(height: 16),
              const ExpandableStepCard(
                number: "1",
                title: "Verifique a consciência",
                description:
                    "Chacoalhe os ombros da pessoa e pergunte em voz alta: \"Você está bem?\". Verifique se ela respira normalmente.",
                imagePath: "assets/images/rcp_1.png",
                themeColor: Color(0xFFD32F2F),
              ),
              const ExpandableStepCard(
                number: "2",
                title: "Ligue para o SAMU (192)",
                description:
                    "Se a pessoa não responder e não estiver respirando normalmente, ligue IMEDIATAMENTE para o SAMU antes de iniciar as compressões.",
                imagePath: "assets/images/rcp_2.png",
                themeColor: Color(0xFFD32F2F),
              ),
              const ExpandableStepCard(
                number: "3",
                title: "Posicione a vítima",
                description:
                    "Deite a pessoa de costas em uma superfície firme e plana. Ajoelhe-se ao lado do tórax da pessoa.",
                imagePath: "assets/images/rcp_3.png",
                themeColor: Color(0xFFD32F2F),
              ),
              const ExpandableStepCard(
                number: "4",
                title: "Posicione as mãos",
                description:
                    "Coloque a palma de uma mão no centro do peito (entre os mamilos). Coloque a outra mão sobre a primeira, entrelaçando os dedos.",
                imagePath: "assets/images/rcp_4.png",
                themeColor: Color(0xFFD32F2F),
              ),
              const ExpandableStepCard(
                number: "5",
                title: "Faça as compressões",
                description:
                    "Com os braços esticados, empurre o peito para baixo cerca de 5 cm. Faça 30 compressões em ritmo rápido (100-120 por minuto) - pense na música \"Stayin' Alive\".",
                imagePath: "assets/images/rcp_5.png",
                themeColor: Color(0xFFD32F2F),
              ),
              const ExpandableStepCard(
                number: "6",
                title: "Ventilações (se souber)",
                description:
                    "Se souber, após 30 compressões, faça 2 ventilações boca a boca. Se não souber, continue apenas as compressões sem parar.",
                imagePath: "assets/images/rcp_6.png",
                themeColor: Color(0xFFD32F2F),
              ),
              const ExpandableStepCard(
                number: "7",
                title: "Continue até a ajuda chegar",
                description:
                    "Continue o ciclo (30 compressões + 2 ventilações) até que: a pessoa volte a respirar, o SAMU chegue, ou você fique extremamente cansado.",
                imagePath: "assets/images/rcp_7.png",
                themeColor: Color(0xFFD32F2F),
              ),
              const SizedBox(height: 10),
              const _InfoCard(
                backgroundColor: Color(0xFFFFEBEE),
                borderColor: Colors.red,
                icon: Icons.close,
                iconColor: Colors.red,
                title: "O que NÃO fazer",
                items: [
                  "Não faça RCP em quem está respirando normalmente",
                  "Não tenha medo de machucar - é melhor tentar do que não fazer nada",
                  "Não pare as compressões por mais de 10 segundos",
                  "Não comprima o estômago ou as costelas",
                ],
              ),
              const SizedBox(height: 16),
              const _InfoCard(
                backgroundColor: Color(0xFFE8F5E9),
                borderColor: Colors.green,
                icon: Icons.lightbulb_outline,
                iconColor: Colors.orange,
                title: "Informações importantes",
                items: [
                  "RCP só deve ser feita em quem NÃO está respirando",
                  "Se houver um DEA (desfibrilador) disponível, peça para alguém buscar",
                  "Continue até que profissionais cheguem ou a pessoa volte a respirar",
                  "É normal ouvir estalos nas costelas - não pare por isso",
                ],
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFEBEE),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.red.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Precisa de ajuda?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87),
                    ),
                    const Text(
                      "Ligue imediatamente para o SAMU",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD32F2F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: _ligarParaSamu,
                        icon: const Icon(Icons.phone, color: Colors.white),
                        label: const Text(
                          "Ligar para SAMU 192",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    )
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
}

class _InfoCard extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final IconData icon;
  final Color iconColor;
  final String title;
  final List<String> items;

  const _InfoCard({
    required this.backgroundColor,
    required this.borderColor,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 24),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("• ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54)),
                    Expanded(
                      child: Text(
                        item,
                        style:
                            const TextStyle(color: Colors.black54, height: 1.3),
                      ),
                    ),
                  ],
                ),
              )),
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
