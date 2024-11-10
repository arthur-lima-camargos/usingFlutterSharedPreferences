import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String placeholder;
  final bool isPassword;
  final TextEditingController controller;
  final VoidCallback? togglePasswordVisibility;
  final bool obscureText;

  const TextInput({
    required this.placeholder,
    required this.controller,
    this.isPassword = false,
    this.togglePasswordVisibility,
    this.obscureText = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? obscureText : false,
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: const TextStyle(color: Colors.black),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
        suffixIcon: isPassword
            ? IconButton(
                icon:
                    Icon(obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: togglePasswordVisibility,
              )
            : null,
      ),
    );
  }
}
