import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final String token;
  const MainPage({super.key, required this.token});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Text(widget.token),
          )),
    );
  }
}
