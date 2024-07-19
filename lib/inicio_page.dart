import 'package:flutter/material.dart';

class InicioPage extends StatelessWidget {
  final String email;

  InicioPage({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Bienvenido, $email'),
      ),
    );
  }
}
