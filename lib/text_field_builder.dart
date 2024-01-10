import 'package:flutter/material.dart';

Widget textFieldBuilder({
  required String label,
  required TextEditingController controller,
  required bool obsecureText,
  TextInputType keyboardType = TextInputType.text,
}) {
  return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obsecureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Colors.greenAccent),
            borderRadius: BorderRadius.circular(10)),
        labelText: label,
      ));
}
