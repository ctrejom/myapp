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
                  CustomFormLogin(
                    label: 'Nombre',
                    controller: nombreController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El nombre es obligatorio';
                      }
                      if (value.length < 3 || value.length > 10) {
                        return 'El nombre debe contener entre 3 y 10 caracteres';
                      }
                      return null;
                    },
                  ),
                  CustomFormLogin(
                    label: 'Correo Electrónico',
                    controller: correoController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El Correo Electrónico es obligatorio';
                      }
                      if (!value.contains('@')) {
                        return 'El Correo Electrónico debe contener un @';
                      }
                      if (value.indexOf('@') != value.lastIndexOf('@')) {
                        return 'No puede haber más de un @';
                      }
                      if (!value.endsWith('@unah.hn')) {
                        return 'El Correo Electrónico debe contener unah.hn';
                      }
                      if (value.contains(' ')) {
                        return 'El Correo Electrónico no puede contener espacios';
                      }
                      return null;
                    },
                  ),
                  CustomFormLogin(
                    label: 'Teléfono',
                    controller: telefonoController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El Teléfono es obligatorio';
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
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'La Contraseña es obligatoria';
                      }
                      if (value.length < 8) {
                        return 'La Contraseña debe tener al menos 8 caracteres';
                      }
                      if (value.contains(' ')) {
                        return 'La Contraseña no puede contener espacios';
                      }
                      if (!RegExp(r'[A-Z]').hasMatch(value)) {
                        return 'La Contraseña debe tener al menos una mayúscula';
                      }
                      if (!RegExp(r'[a-z]').hasMatch(value)) {
                        return 'La Contraseña debe tener al menos una minúscula';
                      }
                      if (!RegExp(r'[0-9]').hasMatch(value)) {
                        return 'La Contraseña debe tener al menos un número';
                      }
                      if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
                        return 'La Contraseña debe tener al menos un caracter especial';
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
                            // Acción a definir para registro exitoso
                            Navigator.pushNamed(context, 'login');
                          }
                        },
                        child: const Text('Registrar'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.deepPurple, backgroundColor: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'login');
                        },
                        child: const Text('Cancelar'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
