import 'package:flutter/material.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Flutter Widgets App",
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 8).getTheme(),
    
       
      /*Scaffold(
        body: Center(
          child: FilledButton(onPressed: (){}, child: Text("Hola mundo")), 
          // se da el color del tema de la app en este caso al button
        ),
      )*/

    );
  }
}
