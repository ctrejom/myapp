import 'package:flutter/material.dart';
import 'package:myapp/login_page.dart';
import 'package:myapp/register_page.dart';
import 'package:myapp/inicio_page.dart';
//bjbhbh
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
// xdd
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
