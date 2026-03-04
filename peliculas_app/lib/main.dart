import 'package:flutter/material.dart';
import 'package:peliculas_app/pages/detalles_page.dart';
import 'package:peliculas_app/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      routes: {
        'home_page': (_) => const HomePage(),
        'detalles_page': (_) => const DetallesPage(),
      },
      initialRoute: 'home_page',
    );
  }
}