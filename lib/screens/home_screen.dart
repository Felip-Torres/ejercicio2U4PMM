import 'dart:math';

import 'package:ejercicio2/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:ejercicio2/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  static const String routerName = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String resultado = "";

  void _onChoiceSelected(String choice) {
    debugPrint('Selected: $choice');

    // Generar un número aleatorio entre 0 y 2 (0: piedra, 1: papel, 2: tijeras)
    final random = Random();
    final randomNumber = random.nextInt(3);
    debugPrint('Selected: $choice, Enemigo: $randomNumber');
    resultado="$choice\n  VS \n";

    switch (randomNumber) {
      case 0:
        resultado+="piedra";
        if (choice == "tijeras") {
          Preferences.vidaJugador -= 10;
          resultado += "\nPierdes";
        } else if (choice == "papel") {
          Preferences.vidaEnemigo -= 10;
          resultado += "\nGanas";
        } else {
          resultado += "\nEmpate";
        }
        break;
      case 1:
        resultado+="papel";
        if (choice == "piedra") {
          Preferences.vidaJugador -= 10;
          resultado += "\nPierdes";
        } else if (choice == "tijeras") {
          Preferences.vidaEnemigo -= 10;
          resultado += "\nGanas";
        } else {
          resultado += "\nEmpate";
        }
        break;
      case 2:
        resultado+="tijeras";
        if (choice == "papel") {
          Preferences.vidaJugador -= 10;
          resultado += "\nPierdes";
        } else if (choice == "piedra") {
          Preferences.vidaEnemigo -= 10;
          resultado += "\nGanas";
        } else {
          resultado += "\nEmpate";
        }
        break;
      default:
        resultado = "error";
    }

    // Comprobación de vida
    if (Preferences.vidaJugador <= 0) {
      Preferences.vidaJugador = 100;
      Preferences.vidaEnemigo = 100;
      resultado = "Moriste";
    }
    if (Preferences.vidaEnemigo <= 0) {
      Preferences.vidaEnemigo = 100;
      resultado = "Avanzas al siguiente piso";
    }

    // Actualizar el estado para que se reflejen los cambios en la UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Personaje(
            nombre: Preferences.nombre,
            vida: Preferences.vidaJugador,
            imagen: "assets/character.png",
          ),
          const SizedBox(height: 10),
          BotonesJuego(
            onChoiceSelected: _onChoiceSelected,
          ),
          const SizedBox(height: 10),
          Text(resultado),
          const SizedBox(height: 10),
          Personaje(
            nombre: "enemigo",
            vida: Preferences.vidaEnemigo,
            imagen: "assets/slime.png",
          ),
        ],
      ),
    );
  }
}
