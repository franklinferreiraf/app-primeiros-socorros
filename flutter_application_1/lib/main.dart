import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Seus imports das telas (garanta que os arquivos existem na pasta lib)
import 'screens/corte_screen.dart';
import 'screens/desmaio_screen.dart';
import 'screens/engasgo_screen.dart';
import 'screens/picada_screen.dart';
import 'screens/queimadura_screen.dart';
import 'screens/rcp_screen.dart';
import 'screens/estabelecimentos_screen.dart';

void main() {
  runApp(const PrimeirosSocorrosApp());
}

class PrimeirosSocorrosApp extends StatelessWidget {
  const PrimeirosSocorrosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SOS Saúde',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _ligarParaSamu() async {
    // Seu número configurado para a apresentação
    final Uri url = Uri(scheme: 'tel', path: '75991964091');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      debugPrint("Não foi possível realizar a chamada.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0xFFD32F2F),
        title: Column(
          children: const [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.info_outline, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  "SOS Saúde",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              "Primeiros socorros rápidos e eficazes",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // --- CARDS DO MENU ---

            // 1. Engasgo (Vermelho)
            HoverableCard(
              title: "Engasgo",
              icon: Icons.no_food_outlined,
              iconColor: Colors.red,
              bgColor: Colors.red.shade50,
              destination: const EngasgoScreen(),
            ),
            // 2. Desmaio (Laranja)
            HoverableCard(
              title: "Desmaio",
              icon: Icons.person_outline,
              iconColor: Colors.orange,
              bgColor: Colors.orange.shade50,
              destination: const DesmaioScreen(),
            ),
            // 3. Queimadura (Vermelho)
            HoverableCard(
              title: "Queimadura",
              icon: Icons.local_fire_department_outlined,
              iconColor: Colors.red,
              bgColor: Colors.red.shade50,
              destination: const QueimaduraScreen(),
            ),
            // 4. Picada (Laranja)
            HoverableCard(
              title: "Picada de Animal",
              icon: Icons.pest_control,
              iconColor: Colors.orange,
              bgColor: Colors.orange.shade50,
              destination: const PicadaAnimalScreen(),
            ),
            // 5. Corte (Vermelho)
            HoverableCard(
              title: "Corte",
              icon: Icons.water_drop_outlined,
              iconColor: Colors.red,
              bgColor: Colors.red.shade50,
              destination: const CorteScreen(),
            ),
            // 6. RCP (Laranja/Amarelo)
            HoverableCard(
              title: "RCP (Parada Cardíaca)",
              icon: Icons.favorite_border,
              iconColor: Colors.orange,
              bgColor: Colors.orange.shade50,
              destination: const RcpScreen(),
            ),
            // 7. Estabelecimentos (Vermelho)
            HoverableCard(
              title: "Estabelecimentos Próximos",
              icon: Icons.location_on_outlined,
              iconColor: Colors.red,
              bgColor: Colors.red.shade50,
              destination: const EstabelecimentosScreen(),
            ),

            const SizedBox(height: 30),

            // --- RODAPÉ ---
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.red.shade100),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.phone_in_talk, color: Colors.red.shade900),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Emergência Médica",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red.shade900,
                                fontSize: 16,
                              ),
                            ),
                            const Text(
                              "Ligue para o SAMU imediatamente em caso grave",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54),
                            ),
                          ],
                        ),
                      )
                    ],
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
                        elevation: 3,
                      ),
                      onPressed: _ligarParaSamu,
                      icon: const Icon(Icons.phone, color: Colors.white),
                      label: const Text(
                        "Ligar para SAMU 192",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget do Card com Hover
class HoverableCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final Widget destination;

  const HoverableCard({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.destination,
  });

  @override
  State<HoverableCard> createState() => _HoverableCardState();
}

class _HoverableCardState extends State<HoverableCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => widget.destination),
            );
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            transform: _isHovered
                ? Matrix4.translationValues(0, -6, 0)
                : Matrix4.identity(),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: _isHovered
                    ? widget.iconColor.withOpacity(0.5)
                    : Colors.grey.shade200,
                width: 1.5,
              ),
              boxShadow: [
                _isHovered
                    ? BoxShadow(
                        color: widget.iconColor.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      )
                    : BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 5,
                        offset: const Offset(0, 4),
                      ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: widget.bgColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(widget.icon, color: widget.iconColor),
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
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Ver instruções",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color:
                          _isHovered ? widget.iconColor : Colors.grey.shade300),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
