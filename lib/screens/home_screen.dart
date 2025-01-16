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
          Preferences.vidaJugador -= 10*Preferences.Piso;
          resultado += "\nPierdes";
        } else if (choice == "papel") {
          Preferences.vidaEnemigo -= 10*Preferences.LVL;
          resultado += "\nGanas";
        } else {
          resultado += "\nEmpate";
        }
        break;
      case 1:
        resultado+="papel";
        if (choice == "piedra") {
          Preferences.vidaJugador -= 10*Preferences.Piso;
          resultado += "\nPierdes";
        } else if (choice == "tijeras") {
          Preferences.vidaEnemigo -= 10*Preferences.LVL;
          resultado += "\nGanas";
        } else {
          resultado += "\nEmpate";
        }
        break;
      case 2:
        resultado+="tijeras";
        if (choice == "papel") {
          Preferences.vidaJugador -= 10*Preferences.Piso;
          resultado += "\nPierdes";
        } else if (choice == "piedra") {
          Preferences.vidaEnemigo -= 10*Preferences.LVL;
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
      Preferences.vidaJugador = 100*Preferences.LVL;
      Preferences.vidaEnemigo = 100;
      Preferences.Piso = 1;
      resultado = "Moriste";
    }
    if (Preferences.vidaEnemigo <= 0) {
      Preferences.Piso++;
      Preferences.vidaEnemigo = 100*Preferences.Piso;
      Preferences.XP += 10 * Preferences.Piso;
      resultado = "Avanzas al siguiente piso";
      if(Preferences.XP>=100){
        while(Preferences.XP>=100){
          Preferences.XP-=100;
          Preferences.LVL+=1;  
        } 
        resultado +="\n Y subes de nivel";
      }
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
        Text("LVL ${Preferences.LVL}",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        // barra XP
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
              value: Preferences.XP/100,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.yellow),
            ),
          ),
        ),
          Personaje(
            nombre: Preferences.nombre,
            vida: Preferences.vidaJugador,
            vidaMax: 100*Preferences.LVL,
            imagen: "assets/personaje.png",
          ),
          const SizedBox(height: 10),
          BotonesJuego(
            onChoiceSelected: _onChoiceSelected,
          ),
          const SizedBox(height: 10),
          Text(resultado,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Personaje(
            nombre: "Slime LVL${Preferences.Piso}",
            vida: Preferences.vidaEnemigo,
            vidaMax: 100*Preferences.Piso,
            imagen: "assets/slime.png",
          ),
        ],
      ),
    );
  }
}
