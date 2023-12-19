import 'package:flutter/material.dart';

Widget textFieldBuilder({
  required String label,
  required TextEditingController controller,
  required bool obsecureText,
}) {
  return TextField(
      controller: controller,
      obscureText: obsecureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.greenAccent),
            borderRadius: BorderRadius.circular(10)),
        labelText: label,
      ));
}
