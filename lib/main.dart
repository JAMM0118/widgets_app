import 'package:flutter/material.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presetation/screens/home/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 8).getTheme(),
      home: const HomeScreen() 
      
      /*Scaffold(
        body: Center(
          child: FilledButton(onPressed: (){}, child: Text("Hola mundo")), 
          // se da el color del tema de la app en este caso al button
        ),
      )*/,
    );
  }
}
