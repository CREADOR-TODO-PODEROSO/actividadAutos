// lista_carros.dart
import 'package:flutter/material.dart';

class ListaCarrosScreen extends StatelessWidget {
  const ListaCarrosScreen({super.key});

  final List<Map<String, dynamic>> carros = const [
    {
      "titulo": "Renault Kwid 2024",
      "precio": "280.000",
      "tiempo": "por semana",
      "desc": "Full equipo • Aire acondicionado • 5 puertas • Ideal para ciudad • Seguro todo riesgo incluido • Kilometraje libre • Entrega a domicilio en Medellín",
      "imagen": "lib/imang/carro 1.webp",
    },
    {
      "titulo": "Chevrolet Onix Turbo 2024",
      "precio": "420.000",
      "tiempo": "por semana",
      "desc": "Automático • Pantalla táctil 8\" • 6 airbags • Cámara de reversa • Bluetooth • Android Auto & Apple CarPlay • Muy cómodo y moderno",
      "imagen": "lib/imang/carro 3.jpg",
    },
    {
      "titulo": "Mazda 3 Sedán 2023",
      "precio": "580.000",
      "tiempo": "por semana",
      "desc": "Cuero • Techo corredizo • Head-Up Display • Sonido Bose • Cámaras 360° • Llantas 18\" • El más elegante y full lujo de la lista",
      "imagen": "lib/imang/carro 4.jpeg",
    },
    {
      "titulo": "Toyota Corolla Cross 2024",
      "precio": "680.000",
      "tiempo": "por semana",
      "desc": "SUV familiar • Baúl gigante • Aire bizona • Apple CarPlay inalámbrico • Seguro full • 5 estrellas en seguridad • Ideal para carretera",
      "imagen": "lib/imang/carro5.webp",
    },
    {
      "titulo": "Kia Picanto 2025",
      "precio": "240.000",
      "tiempo": "por semana",
      "desc": "0 km • Garantía Kia 7 años • Económico en gasolina • Fácil de parquear • Pantalla 8\" • Cámara de reversa • El más barato y confiable",
      "imagen": "lib/imang/carro 6.webp",
    },
    {
      "titulo": "Suzuki Swift Sport 2023",
      "precio": "490.000",
      "tiempo": "por semana",
      "desc": "1.4 Turbo 140 HP • Manual 6 velocidades • Asientos deportivos • Suspensión deportiva • Muy divertido de manejar • Para los que les gusta sentir el carro",
      "imagen": "lib/imang/carro 7.webp",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alquiler de Carros"),
        backgroundColor: Colors.orange[800],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.68, // Ajustado para que quepa todo
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: carros.length,
        itemBuilder: (context, i) {
          final c = carros[i];

          return Card(
            elevation: 12,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Foto
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      c["imagen"],
                      height: 110,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 10),

                  
                  Text(
                    c["titulo"],
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 4),

                  
                  Text(
                    c["tiempo"],
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),

                  const SizedBox(height: 6),

                  
                  Text(
                    "\$${c["precio"]}",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[800],
                    ),
                  ),

                  const SizedBox(height: 8),

                  
                  Text(
                    c["desc"],
                    style: const TextStyle(fontSize: 12.5, height: 1.4, color: Colors.black87),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const Spacer(),

                  ////////////////////////
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 6,
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green[700],
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              "¡${c["titulo"]} reservado! Te contactomois en minutos por WhatsApp",
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        "ARQUILAR",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}