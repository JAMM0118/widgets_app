import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presetation/providers/theme_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child:MainApp()
    )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context,ref) {
    //final isModeDark = ref.watch(isDarkThemeProvider);
    //final selectedColorIndex = ref.watch(selectedColorProviderIndex);
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      title: "Flutter Widgets App",
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
      
      /*Scaffold(
        body: Center(
          child: FilledButton(onPressed: (){}, child: Text("Hola mundo")), 
          // se da el color del tema de la app en este caso al button
        ),
      )*/


    );
  }
}
