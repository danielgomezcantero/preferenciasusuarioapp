import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/share_preferences/preferencias_usuario.dart';
import 'package:preferenciasusuarioapp/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'setting';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario;
  int _genero;
  String _nombre = 'Daniel';

  final prefs = new PreferenciasUsuarios();

  TextEditingController _textController;
  @override
  void initState() {
    super.initState();
    //* _cargarGenero();
    _genero = prefs.genero;
    prefs.ultimaPagina = SettingsPage.routeName;

    _colorSecundario = prefs.colorSecundario;
    _textController = new TextEditingController(text: prefs.nombreUsuario);
  }

  // Carga el genero cuando se crea la pagina de Settings
  // _cargarGenero() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   _genero = prefs.getInt('genero');
  //   setState(() {});
  // }
  //* Refactor de settings

  // _selectGenero(int value) async {
  //   //Se guarda el valor en las preferencias del usuario
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   prefs.setInt('genero', value);
  //   _genero = value;
  //   setState(() {});
  // }

  _selectGenero(int value) {
    prefs.genero = value;

    _genero = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
          backgroundColor: (prefs.colorSecundario) ? Colors.blue : Colors.teal,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
              value: _colorSecundario,
              title: Text('Color secundario:'),
              onChanged: (value) {
                prefs.colorSecundario = value;
                _colorSecundario = value;
                setState(() {});
              },
            ),
            RadioListTile(
              value: 1,
              title: Text('Masculino'),
              groupValue: _genero,
              onChanged: _selectGenero,
            ),
            RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: _genero,
              onChanged: _selectGenero,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre que usa el teléfono'),
                onChanged: (value) {
                  prefs.nombreUsuario = value;
                },
              ),
            )
          ],
        ));
  }
}
