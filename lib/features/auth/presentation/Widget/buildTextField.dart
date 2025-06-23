import 'package:flutter/material.dart';

Widget buildTextField(
  String hint, {
  bool isPassword = false,
  IconData? icon,
  TextEditingController? controller,
}) {
  return TextFormField(
    controller: controller,
    obscureText: isPassword,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: const Color(0xFFB7B4B4)),
      filled: true,
      fillColor: const Color(0xFFF9FAFB),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: const Color(0xFF0E73B7), width: 1.5),
      ),
      prefixIcon: icon != null
          ? Icon(icon, color: const Color(0xFFB7B4B4))
          : null,
    ),
    style: const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
      color: Color(0xFF12416F),
    ),
  );
}
