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
              ),
              CustomFormLogin(
                controller: contraseniaController,
                label: 'Contraseña',
              ),
              Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                    ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          Navigator.pushNamed(context, 'inicio'); //Pongo Push para poder volver de forma temporal
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
                  ]))
            ],
          ),
        ),
      )),
    );
  }
}
