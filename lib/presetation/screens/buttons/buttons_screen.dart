import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( //significa que una pantalla tiene un appbar y un body
      appBar: AppBar(
        title: const Text("Buttons Screen"),
      ),
      body: Container(color: Colors.teal,),
  );
  }
}