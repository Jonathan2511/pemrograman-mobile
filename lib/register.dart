// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:sesi10sampai14/text_field_builder.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  TextEditingController nimController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            textFieldBuilder(
              label: "Name",
              controller: nameController,
              obsecureText: false,
            ),
            SizedBox(
              height: 8,
            ),
            textFieldBuilder(
                label: "NIM", controller: nimController, obsecureText: false),
            SizedBox(
              height: 8,
            ),
            textFieldBuilder(
              label: "Password",
              controller: passwordController,
              obsecureText: true,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Register")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
