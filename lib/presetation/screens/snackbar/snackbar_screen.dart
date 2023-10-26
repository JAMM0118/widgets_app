import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  
  static const name = "snackbar_screen";
  const SnackBarScreen({super.key});
  
    
  void showCustomSnackBar(BuildContext context){
    ScaffoldMessenger.of(context).clearSnackBars(); //limpia los snackbar que esten en pantalla para que no se acumulen
    
    final snackBar = SnackBar(
      content: const Text("Hello there!"),
      action: SnackBarAction(
        label: "Ok",
        onPressed: () {},
      ),
      duration: const Duration(seconds: 2),
      
    );
    
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context){
    showDialog(
      context: context, 
      barrierDismissible: false, //para que no se pueda cerrar el dialogo dando click fuera de el
      builder: (context) => AlertDialog(
        title: const Text("Dialogo de prueba"),
        content: const Text("Deserunt in laborum proident quis. Reprehenderit elit non incididunt ullamco et ipsum. Mollit nostrud et dolore reprehenderit qui occaecat proident ullamco. Ullamco ea deserunt minim tempor amet anim dolor laboris reprehenderit qui consequat."),
        actions: [
          TextButton(
            onPressed: ()=> context.pop(), 
            child: const Text("Cancelar"),  
          ),
          FilledButton(
            onPressed: () => context.pop(), 
            child: const Text("Aceptar")
          )

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SnackBar y Dialogos"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(context: context,
                children: [
                  const Text("Ipsum duis occaecat eu ea. Reprehenderit deserunt laborum aute enim non. Sit est dolor culpa laborum adipisicing ex do mollit ad irure quis et. Occaecat consequat sit fugiat est labore qui. Ea labore consectetur laboris non occaecat ex cupidatat deserunt cillum. Est et veniam excepteur fugiat Lorem sunt incididunt pariatur consectetur.")
                ]);
              }, 
            
            child: const Text("Licencias usadas")
            ),
            
            FilledButton.tonal(
              onPressed: () => openDialog(context), 
            
            child: const Text("Motrar dialogo")
            ),
          ],
        )
      ),
        

      floatingActionButton: FloatingActionButton.extended( //sirve para ponerle texto al boton flotante
        label: const Text("Mostrar SnackBar"),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackBar(context),

      ),
    );
  }
}