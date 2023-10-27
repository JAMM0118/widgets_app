import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presetation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final isDarkMode = ref.watch(isDarkThemeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Changer"),
        actions: [
          IconButton(

            icon: Icon(isDarkMode ? Icons.light_mode_outlined: Icons.dark_mode_outlined),

            onPressed: (){
              ref.read(isDarkThemeProvider.notifier).update((state) => !state);
            },
          )
        ]
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context,ref) {
    
    final List<Color> colorList = ref.watch(colorListProvider);
    final selectedColorIndex = ref.watch(selectedColorProviderIndex);

    return ListView.builder(
      itemCount: colorList.length,
      itemBuilder: (context, index) {
        final colores = colorList[index];
        return RadioListTile(
          title: Text("Este color", style: TextStyle(color: colores),),
          subtitle: Text("${colores.value}"),
          activeColor: colores, //color del radio button segun el index
          value: index , 
          groupValue: selectedColorIndex , 
          onChanged: (value){
            ref.read(selectedColorProviderIndex.notifier).update((value) => index);
          }
        );
      },
    );
  }
}