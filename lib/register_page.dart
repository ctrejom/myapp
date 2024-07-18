import 'package:flutter/material.dart';
import 'package:myapp/widgets/custom_form_login.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final nombreController = TextEditingController();
  final correoController = TextEditingController();
  final telefonoController = TextEditingController();
  final contraseniaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registro'),
        ),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: formkey,
                child: Column(children: [
                  CustomFormLogin(
                    label: 'Nombre',
                    controller: nombreController,
                  ),
                  CustomFormLogin(
                    label: 'Correo Electronico',
                    controller: correoController,
                  ),
                  CustomFormLogin(
                    label: 'Telefono',
                    controller: telefonoController,
                    keyboardType: TextInputType.number,
                  ),
                  CustomFormLogin(
                    label: 'Contraseña',
                    controller: contraseniaController,
                  ),
                  Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                        ElevatedButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              print(
                                  'Nombre de usuario: ${nombreController.text}');
                              print(
                                  'Correo Electronico: ${correoController.text}');
                              print('Telefono: ${telefonoController.text}');
                              print(
                                  'Contraseña: ${contraseniaController.text}');
                            }
                          },
                          child: const Text('Registrarse'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black87,
                          ),
                        ),
                      ]))
                ]),
              )),
        ));
  }
}
