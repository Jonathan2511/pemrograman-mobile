// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sesi10sampai14/text_field_builder.dart';
import 'service.dart';

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
                ElevatedButton(
                    onPressed: () {

                      showConfirmationDialog(context);
                    },
                    child: Text("Register")),
              ],
            )
          ],
        ),
      ),
    );
  }
  void showConfirmationDialog(BuildContext context){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Konfirmasi'),
          content: Text('Apakah anda yakin?'),
          actions:[
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text('Tidak'),
            ),
            ElevatedButton(
              onPressed: () async{
                String nim = nimController.text.trim();
                String password = passwordController.text;
                String name = nameController.text.trim();
                try{
                  Response? response = await Services.register(
                      name: name,
                      nim: nim,
                      password: password,
                  );
                  if(mounted) {
                    Navigator.of(context).pop();
                    showDialog(
                        context: context,
                        builder: (context){
                        return AlertDialog(
                        title: Text('Berhasil'),
                        content: Text(response!.data['message']),
                          actions: [
                            ElevatedButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text('Ok'),
                            )
                          ],
                      );

                    });
                    nameController.clear();
                    nimController.clear();
                    passwordController.clear();
                  }
                }catch(e){
                  debugPrint(e.toString());
                  if(mounted){
                    Navigator.of(context).pop();
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Gagal'),
                          content: Text(
                            e.toString(),
                          ),
                          actions: [
                            ElevatedButton(
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                                child: Text('Ok'))
                          ],
                        )
                    );
                  }
                }
              },
              child: Text('Ya'),
            )
          ],
          // actionsAlignment: MainAxisAlignment.Start,
        );
      },
    );
  }
}


