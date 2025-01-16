import 'package:flutter/material.dart';

class Personaje extends StatelessWidget {
  const Personaje({
    super.key,
    this.vida = 100,
    required this.nombre,
    required this.imagen,
  });

  final int vida;
  final String nombre;
  final String imagen;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // barra de vida
        Container(
          width: 200,
          height: 20,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: vida/100,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Nombre personaje
        Text(
          nombre,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        // Imagen
        Image.asset(
          imagen,
          width: 100,
          height: 100,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 100,
              height: 150,
              color: Colors.grey[300],
              child: const Icon(
                Icons.error_outline,
                size: 40,
                color: Colors.red,
              ),
            );
          },
        ),
      ],
    );
  }
}