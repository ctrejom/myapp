import 'package:flutter/material.dart';

class CustomFormLogin extends StatelessWidget {
  const CustomFormLogin({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
  });

  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: TextInputType.text,
      maxLength: 20,
      maxLines: 1,
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        errorText: null,
        suffixIcon: Icon(Icons.remove_red_eye),
        prefixIcon: Icon(Icons.person),
      ),
    );
  }
}