import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _nombre = "Cambia el nombre en los ajustes";
  static bool _DarkMode = false;
  static int _vidaJugador = 100;
  static int _vidaEnemigo = 100;

  static Future init() async{
    _prefs = await SharedPreferences.getInstance();
  }

  static String get nombre {
    return _prefs.getString('nombre') ?? _nombre;
  }

  static set nombre(String nombre){
    _nombre = nombre;
    _prefs.setString('nombre', nombre);
  }

  static bool get  DarkMode {
    return _prefs.getBool('DarkMode') ?? _DarkMode;
  }

  static set DarkMode(bool DarkMode){
    _DarkMode = DarkMode;
    _prefs.setBool('DarkMode', DarkMode);
  }

  static int get vidaJugador {
    return _prefs.getInt('vidaJugador') ?? _vidaJugador;
  }

  static set vidaJugador(int vidaJugador){
    _vidaJugador = vidaJugador;
    _prefs.setInt('vidaJugador', vidaJugador);
  }

  static int get vidaEnemigo {
    return _prefs.getInt('vidaEnemigo') ?? _vidaEnemigo;
  }

  static set vidaEnemigo(int vidaEnemigo){
    _vidaEnemigo = vidaEnemigo;
    _prefs.setInt('vidaEnemigo', vidaEnemigo);
  }
  
}