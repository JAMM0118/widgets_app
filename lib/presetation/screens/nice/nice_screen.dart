import 'package:flutter/material.dart';

class NiceScreen extends StatelessWidget {
  const NiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nice Screen"),
      ),
      body: Container(color: Colors.teal,),
  );
  }
}