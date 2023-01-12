import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.text,
    required this.icon,
    required this.keyboardType,
    this.obscureText = false,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;
  final String text;
  final IconData icon;
  final TextInputType keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: PhysicalModel(
        color: Colors.white,
        elevation: 5,
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              prefixIcon: Icon(icon),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12),
              ),
              hintText: text),
        ),
      ),
    );
  }
}
