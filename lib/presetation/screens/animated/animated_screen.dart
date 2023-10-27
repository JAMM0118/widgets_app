import 'dart:math' show Random;  //de esta manera se importa solo una parte de la libreria
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  
  //static const name = "animated_screen";

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double ancho = 50;
  double altura = 50;
  Color colorContainer = Colors.teal;
  double borderRadiusValue = 10.0;

  void changeShape(){
    final ramdom = Random();

    ancho = ramdom.nextInt(300) + 120;
    altura = ramdom.nextInt(300) + 120;
    colorContainer = Color.fromRGBO(
      ramdom.nextInt(255), //red
      ramdom.nextInt(255), //green
      ramdom.nextInt(255),  //blue
      1 //opacity
    );
    borderRadiusValue = ramdom.nextInt(100) + 20;

    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Container"),

      ),

      body: Center(
        child: 
        AnimatedContainer( //sirve para animar un contenedor
          duration: const Duration(milliseconds: 400),
          curve: Curves.elasticInOut,
          width: ancho <= 0 ? 50 : ancho,
          height: altura <= 0 ? 50 : altura,
          decoration: BoxDecoration( //decoracion del contenedor
            color: colorContainer,
            borderRadius: BorderRadius.circular(borderRadiusValue <= 0 ? 10 : borderRadiusValue)
          ),  
        ),
      ),
      

      floatingActionButton: FloatingActionButton(
        onPressed: changeShape, //se llama a la funcion de esta manera cuando no se le pasan parametros naisu
        child: const Icon(Icons.play_arrow),
      )
    );
  }
}