// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sesi10sampai14/main_page.dart';
import 'package:sesi10sampai14/service.dart';
import 'package:sesi10sampai14/text_field_builder.dart';
import 'register.dart';
import 'package:dio/dio.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nimController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              textFieldBuilder(
                  label: "NIM",
                  controller: nimController,
                  obsecureText: false,
                  keyboardType: TextInputType.number),
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
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: Text("Register")),
                  ElevatedButton(
                      onPressed: () async {
                        String nim = nimController.text.trim();
                        String password = passwordController.text.trim();
                        try {
                          Map? response = await Services.login(
                              nim: nim, password: password);
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(response!["message"])));
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MainPage(token: response["token"])));
                          }
                        } catch (e) {
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                              e.toString(),
                            )));
                          }
                        }
                      },
                      child: Text("Login"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
