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
                      validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El nombre es obligatorios';
                      }

                      if (value.length < 3 || value.length > 10) {
                        return 'El nombre debe contener entre 3 y 10 caracteres';
                      }
                      return null;
                    },
                  ),
                  CustomFormLogin(
                    label: 'Correo Electronico',
                    controller: correoController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El Correo Electronico es obligatorio';
                      }

                      if (!value.contains('@')) {
                        return 'El Correo Electronico debe contener un @';
                      }
                      if (value.indexOf('@') != value.lastIndexOf('@')) {
                        return 'No puede haber más de un @';
                      }
                      if (!value.endsWith('@unah.hn')) {
                        return 'El Correo Electronico debe contener unah.hn';
                      }
                      if (value.contains(' ')) {
                        return 'El Correo Electronico no puede contener espacios';
                      }

                      return null;
                    },
                  ),
                  CustomFormLogin(
                    label: 'Telefono',
                    controller: telefonoController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El Telefono es obligatorio';
                      }
                      if (value.length != 8) {
                        return 'El Teléfono debe tener exactamente 8 números';
                      }
                      if (value[0] != '3' && value[0] != '9') {
                        return 'El Teléfono debe iniciar con 3 o 9';
                      }
                      if (value.contains(' ')) {
                        return 'El Teléfono no puede contener espacios';
                      }
                      if (value.contains(',') || value.contains('.')) {
                        return 'El Teléfono no puede contener puntos o comas';
                      }
                      if (value.contains('-')) {
                        return 'El Teléfono no puede contener guiones';
                      }
                      return null;
                    },
                  ),
                  CustomFormLogin(
                    label: 'Contraseña',
                    controller: contraseniaController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'La contraseña es obligatoria';
                      }
                      if (value.length < 8) {
                        return 'La contraseña debe tener al menos 8 caracteres';
                      }

                      if (!value.contains(RegExp(r'[A-Z]'))) {
                        return 'La contraseña debe contener al menos una letra mayúscula';
                      }
                      if (!value.contains(RegExp(r'[a-z]'))) {
                        return 'La contraseña debe contener al menos una letra minúscula';
                      }
                      if (!value.contains(RegExp(r'[!@#$%^&*()_+-]'))) {
                        return 'La contraseña debe contener al menos un carácter especial';
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
                              print('Nombre de usuario: ${nombreController.text}');
                              print( 'Correo Electronico: ${correoController.text}');
                              print('Telefono: ${telefonoController.text}');
                              print('Contraseña: ${contraseniaController.text}');
                            }
                          },
                          child: const Text('Registrarse'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black87,
                          ),
                        ),
                      ]
                    )
                  )
                ]
              ),
            )
          ),
        )
    );
  }
}
