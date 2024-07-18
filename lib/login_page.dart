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
        backgroundColor: Colors.black87,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formkey,
          child: Column(
            children: [
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
                    return 'El Usuario que ingreso es incorrecto';
                  }
                  return null;
                },
              ),
              CustomFormLogin(
                controller: contraseniaController,
                label: 'Contraseña',
                validator: (valor) {
                  if ((valor!.isEmpty)) {
                    return 'La Contraseña es obligatoria';
                  }
                  final usuario = nombreController.text.toUpperCase();
                  if (usuario == 'CTREJOM@UNAH.HN' && valor != '20212000569') {
                    return 'Contraseña incorrecta para el usuario';
                  } else if (usuario == 'WAI.TSE@UNAH.HN' &&
                      valor != '20212000972') {
                    return 'Contraseña incorrecta para el usuario';
                  }
                  return null;
                },
              ),
              Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                    ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          return null;
                        }
                      },
                      child: const Text('Iniciar sesión'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'Registrar');
                      },
                      child: const Text('Registrarse'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.black87, // Color del botón en modo oscuro
                      ),
                    ),
                  ]
                )
              )
            ],
          ),
        ),
      )),
    );
  }
}
