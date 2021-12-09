import 'package:flutter/material.dart';
import 'package:flutter_preferences_user/src/shared_prefs/preferences_user.dart';

import '../widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static const String routeName = 'home';
  final prefs = PreferentecesUser();

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferences User'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: const MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Text('Color Secudario: ${prefs.colorSecundario}'),
          const Divider(),
          Text('Genero: ${prefs.genero}'),
          const Divider(),
          Text('Nombre Usuario: ${prefs.nombreUsuario}'),
          const Divider()
        ]
      ),
    );
  }
}
