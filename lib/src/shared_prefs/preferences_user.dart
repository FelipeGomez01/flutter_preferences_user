import 'package:shared_preferences/shared_preferences.dart';

class PreferentecesUser
{
  static final PreferentecesUser _instancia = PreferentecesUser._internal();
  late SharedPreferences _prefs;

  PreferentecesUser._internal();

  factory PreferentecesUser()
  {
    return _instancia;
  }

  initPrefs() async
  {
    _prefs = await SharedPreferences.getInstance();
  }

  int get genero
  {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value)
  {
    _prefs.setInt('genero', value);
  }

  bool get colorSecundario
  {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value)
  {
    _prefs.setBool('colorSecundario', value);
  }

  String get nombreUsuario
  {
    return _prefs.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario(String value)
  {
    _prefs.setString('nombreUsuario', value);
  }

  String get ultimaPagina
  {
    return _prefs.getString('ultimaPagina') ?? 'home';
  }

  set ultimaPagina(String value)
  {
    _prefs.setString('ultimaPagina', value);
  }
}