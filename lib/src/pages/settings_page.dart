import 'package:flutter/material.dart';
import 'package:flutter_preferences_user/src/shared_prefs/preferences_user.dart';
import 'package:flutter_preferences_user/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget
{
  static const String routeName = 'settings';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
{
  late bool _colorSecundario;
  late int _genero;

  late TextEditingController _textController;

  final prefs = PreferentecesUser();

  @override
  void initState(){
    super.initState();

    prefs.ultimaPagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;

    _textController = TextEditingController(text: prefs.nombreUsuario);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: const MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(5.0),
            child: const Text(
              'Settings',
              style: TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.bold
              ),
            )
          ),
          const Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: const Text('Color Secundario'),
            onChanged: (value) {
              setState(() {
                _colorSecundario = value;
                prefs.colorSecundario = value;
              });
            }
          ),
          RadioListTile(
            value: 1,
            title: const Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio
          ),
          RadioListTile(
            value: 2,
            title: const Text('Femenino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el telefono'
              ),
              onChanged: (value) {
                prefs.nombreUsuario = value;
              }
            )
          )
        ]
      )
    );
  }

  _setSelectedRadio(int? value) async
  {
    setState(() {
      prefs.genero = value ?? 1;
      _genero = value ?? 1;
    });
  }
}
