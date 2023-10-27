import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  //static const name = "progress_screen";
  
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress Indicators"),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(children: [
        SizedBox(height: 30),
        
        Text("Circular Progress Indicator Infinite"),
        SizedBox(height: 20),
        
        CircularProgressIndicator(
            strokeWidth: 4, backgroundColor: Colors.black12),
        SizedBox(height: 30),
        
        Text("Progress indicador controlado Circular y Lineal"),
        SizedBox(height: 20),
        
        _ControlledProgressIndicator(),
      ]),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {

    return StreamBuilder( //esta asociado a un stream que es un flujo de datos y hace el disposue automaticamente

      stream: Stream.periodic(const Duration(milliseconds: 300), (value){
        return (value *2) /100; // 0.0 - 1.0 son los rangos de los valores 

      }).takeWhile((value) => value < 100), //se ejecuta hasta que el valor sea menor a 100


      builder: (context, snapshot) {
        
        final progressValue = snapshot.data ?? 0; //si no hay data se pone 0.0

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            CircularProgressIndicator(
                value: progressValue ,strokeWidth: 4, backgroundColor: Colors.black12),
            const SizedBox(width: 20),
            Expanded(
              child: LinearProgressIndicator(value: progressValue)
            ),
          ]),
        );
      }
    );
  }
}
