import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( //significa que una pantalla tiene un appbar y un body
      appBar: AppBar(
        title: const Text("Buttons Screen"),
      ),
      body: const  _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_outlined),
        
        onPressed: () => context.pop(),
      ),
  );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity, //sirve para que el contenedor ocupe todo el ancho de la pantalla

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    
        child: Wrap( //se usa para que los botones se acomoden en la pantalla y no se salgan de ella
    
          spacing: 10, //sirve para dar espacio entre los botones
          
          alignment: WrapAlignment.center, //sirve para alinear los botones al centro de la pantalla de forma horizontal
          children: [
            ElevatedButton(onPressed: (){}, child: const Text("Elevated")),

            const ElevatedButton(onPressed: null, child: Text("Elevated Disabled")),

            ElevatedButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.access_alarm_rounded), 
              label: const Text("Elevated Icon")
              ),

              FilledButton(onPressed: (){}, child: const Text("Filled")),

              FilledButton.icon(
                onPressed: (){}, 
                icon: const Icon(Icons.accessibility_new_sharp), 
                label: const Text("Filled Icon")
                ),

              OutlinedButton(onPressed: (){}, child: const Text("Outlined")),

              OutlinedButton.icon(onPressed: (){}, 
              icon: const Icon(Icons.account_tree_rounded), 
              label: const Text("Outlined Icon")
              ),

              TextButton(onPressed: (){}, child: const Text("Text")),

              const CustomButton(),
              
              TextButton.icon(
                onPressed: (){},
                icon: const Icon(Icons.add_box),
                label: const Text("Text Icon"),
              ),

              IconButton(onPressed: (){}, icon: const Icon(Icons.workspaces_rounded)),
              
              IconButton(
                onPressed: (){},
                icon: const Icon(Icons.workspaces_rounded),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(colors.primary),
                  iconColor: const MaterialStatePropertyAll(Colors.white), 
                ),

              ) 
          ],
        ),
      ),
    );
    //Container(color: Colors.teal, child: const Center(child: Text("Buttons Screen")));
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
    
      child: Material(
    
        color: colors.primary,
        
        child: InkWell(
          splashColor: Colors.yellow,
          //overlayColor: const MaterialStatePropertyAll(Colors.green),
          highlightColor: Colors.red,
          
          onTap: (){},
          child: const Padding(
           
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text("My Button", style: TextStyle(color: Colors.white))
            ),
        ),
      ),
    );
  }
}