import 'package:ejercicio2/preferences/preferences.dart';
import 'package:ejercicio2/widgets/botonesJuego.dart';
import 'package:ejercicio2/widgets/personaje.dart';
import 'package:flutter/material.dart';
import 'package:ejercicio2/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routerName = 'home';

  const HomeScreen({Key? key}) : super(key: key);

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
            Personaje(nombre: Preferences.nombre, vida: Preferences.vidaJugador, imagen: "assets/character.png",),
            const SizedBox(height: 10,),
            BotonesJuego(
              onChoiceSelected: (choice) {
              // Handle the selected choice here
              debugPrint('Selected: $choice');
              },
            ),
            const SizedBox(height: 10,),
            const Personaje(nombre: "enemigo", imagen: "assets/slime.png",),
          ],
        ));
  }
}
