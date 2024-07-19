import 'package:flutter/material.dart';
import 'package:myapp/inicio_page.dart';
import 'package:myapp/login_page.dart';
import 'package:myapp/register_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tercera Tarea',
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginPage(),
        'Registrar': (context) => RegisterPage(),
        'Home': (context) => InicioPage(email: ''),
      },
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
