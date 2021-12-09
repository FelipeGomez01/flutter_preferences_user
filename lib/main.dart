import 'package:flutter/material.dart';
import 'package:flutter_preferences_user/src/pages/home_page.dart';
import 'package:flutter_preferences_user/src/routes/routes.dart';
import 'package:flutter_preferences_user/src/shared_prefs/preferences_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = PreferentecesUser();
  await prefs.initPrefs();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prefs = PreferentecesUser();

    return MaterialApp(
      title: 'Preferences User',
      initialRoute: prefs.ultimaPagina,
      routes: getApplicationRoutes(),
    );
  }
}