import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/pages/home_page.dart';
import 'package:preferenciasusuarioapp/src/pages/settings_page.dart';
import 'package:preferenciasusuarioapp/src/share_preferences/preferencias_usuario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuarios();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = new PreferenciasUsuarios();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferencias ',
      //initialRoute: HomePage.routeName,
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        SettingsPage.routeName: (context) => SettingsPage(),
      },
    );
  }
}
