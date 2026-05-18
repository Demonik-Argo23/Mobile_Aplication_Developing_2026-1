import 'package:flutter/material.dart';
import 'package:formulario_app/pages/inicio_page.dart';
import 'package:formulario_app/pages/registro_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'inicio_page',
      routes: {
        'inicio_page': (_) =>  InicioPage(),
        'registro_page': (_) =>   RegistroPage(),
      },
    );
  }
}
  