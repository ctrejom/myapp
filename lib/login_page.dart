import 'package:flutter/material.dart';
import 'package:myapp/widgets/custom_form_login.dart';
import 'package:myapp/inicio_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final nombreController = TextEditingController();
  final contraseniaController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bienvenido',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomFormLogin(
                    controller: nombreController,
                    label: 'Nombre de Usuario',
                    validator: (valor) {
                      if ((valor!.isEmpty)) {
                        return 'El nombre es obligatorio';
                      }
                      final usuario = valor.toUpperCase();
                      if ((usuario != 'CTREJOM@UNAH.HN') &&
                          (usuario != 'WAI.TSE@UNAH.HN')) {
                        return 'El Usuario que ingresó es incorrecto';
                      }
                      return null;
                    },
                  ),
                  CustomFormLogin(
                    controller: contraseniaController,
                    label: 'Contraseña',
                    obscureText: true,
                    validator: (valor) {
                      if ((valor!.isEmpty)) {
                        return 'La Contraseña es obligatoria';
                      }
                      final usuario = nombreController.text.toUpperCase();
                      if (usuario == 'CTREJOM@UNAH.HN' &&
                          valor != '20212000569') {
                        return 'Contraseña incorrecta para el usuario';
                      } else if (usuario == 'WAI.TSE@UNAH.HN' &&
                          valor != '20212000972') {
                        return 'Contraseña incorrecta para el usuario';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    InicioPage(email: nombreController.text),
                              ),
                            );
                          }
                        },
                        child: const Text('Iniciar sesión'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.deepPurple,
                          backgroundColor: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'Registrar');
                        },
                        child: const Text('Registrarse'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
