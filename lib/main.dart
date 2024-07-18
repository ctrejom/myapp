import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tercera Tarea',
      initialRoute: 'login', //Ruta previamente definida
      routes: {
        //'login': (context) => LoginPage(),
        //'Registrar': (context) => RegisterPage(),
        //'inicio': (context) => const InicioPage(),
      },
    );
  }
}
