import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _nombre = "Cambia el nombre en los ajustes";
  static bool _DarkMode = false;
  static int _vidaJugador = 100;
  static int _vidaEnemigo = 100;
  static int _xp = 0;
  static int _lvl = 1;
  static int _piso = 1;

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

  static int get XP {
    return _prefs.getInt('XP') ?? _xp;
  }

  static set XP(int XP){
    _xp = XP;
    _prefs.setInt('XP', XP);
  }

  static int get LVL {
    return _prefs.getInt('LVL') ?? _lvl;
  }

  static set LVL(int LVL){
    _lvl = LVL;
    _prefs.setInt('LVL', LVL);
  }

  static int get Piso {
    return _prefs.getInt('Piso') ?? _piso;
  }

  static set Piso(int Piso){
    _piso = Piso;
    _prefs.setInt('Piso', Piso);
  }
  
}