import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presetation/providers/counter_provider.dart';
import 'package:widgets_app/presetation/providers/theme_provider.dart';

//Recuerda que el main se debe poner dentro del widget ProviderScope

class CounterScreen extends ConsumerWidget { //sirve para que se actualice el widget cuando cambie el valor del provider
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) { //con esto tenemos la referencia del provider- riverpod
  
    final int counterValue = ref.watch(counterProvider); //con esto obtenemos el valor del provider
    final bool isDarkMode = ref.watch(isDarkThemeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Screen"),
        actions: [
          IconButton(

            icon: Icon(isDarkMode ? Icons.light_mode_outlined: Icons.dark_mode_outlined),

            onPressed: (){
              //con esto obtenemos el valor del provider actual y lo cambiamos
              ref.read(isDarkThemeProvider.notifier).update((state) => !state); 
            },
          )
        ],
      ),
      body: Center(child: Text("Valor: $counterValue", style: Theme.of(context).textTheme.titleLarge)),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //forma 1
          //ref.read(counterProvider.notifier).state++; //con esto obtenemos el valor del provider actual y lo incrementamos
          
          //forma 2 :V
          ref.read(counterProvider.notifier).update((state) =>state + 1); 
          //con esto obtenemos el valor del provider actual y lo incrementamos
          
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}