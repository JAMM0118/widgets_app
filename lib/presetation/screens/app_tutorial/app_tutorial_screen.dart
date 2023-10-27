import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SlideInfo {
  final String title;
  final String description;
  final String imageUrl;

  SlideInfo({required this.title, required this.description, required this.imageUrl});
  
}

final slides = <SlideInfo>[
  SlideInfo(title: "Busca la comida", description: "Nostrud cupidatat laborum pariatur incididunt dolore sit tempor elit enim. Officia adipisicing ipsum incididunt commodo nisi aute laborum irure id cillum cillum proident nisi proident. Lorem nostrud ad ea qui duis id Lorem velit quis labore sit.", imageUrl: "assets/images/1.png"),
  SlideInfo(title: "Entrega rapida", description: "Ad elit nisi pariatur non nostrud. Irure elit est voluptate ea culpa. Consequat commodo reprehenderit enim elit.", imageUrl: "assets/images/2.png"),
  SlideInfo(title: "Disfruta la comida", description: "Duis tempor aliqua eu esse est adipisicing do dolor pariatur esse pariatur reprehenderit. Proident Lorem nostrud consequat minim voluptate incididunt occaecat velit culpa mollit. Exercitation aliquip Lorem dolor eiusmod sit quis sunt ipsum amet est. Irure dolore adipisicing id consequat nulla. Eu ad voluptate minim cillum dolore fugiat eu sit pariatur ea ad veniam laborum in.", imageUrl: "assets/images/3.png"),
];


class AppTutorialScreen extends StatefulWidget {
  
  //static const name = "tutorial_screen";
  
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    
    super.initState();

    pageViewController.addListener(() { 
      final page = pageViewController.page ?? 0; //se obtiene la pagina actual
      if(!endReached && page >= slides.length - 1.5) setState(() => endReached = true); 
      //si la pagina actual es la ultima de la cantidad de slides
      // se cambia el estado de endReached a true (para mostrar el boton de empezar)
    });
    
  }

  //se destruye el pageViewController para evitar que se quede en memoria y consuma recursos
  //usar cada vez que se use un controller o setState
  //es una buena practica hacer esto
  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            //scrollDirection: Axis.vertical,
            controller: pageViewController,
            physics: const BouncingScrollPhysics(), //para evitar que haga ese efecto de rebote
            children: slides.map((slideData) => _Slide( //se mapea cada slide
              title: slideData.title,
              description: slideData.description,
              imageUrl: slideData.imageUrl,
            )).toList(), //se convierte en lista porque el children espera una lista
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text("Skip"),
              onPressed: () => context.pop(),
            ),
            
          ),

          endReached ? Positioned( //si se llega al final se muestra el boton de empezar
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(milliseconds: 200),
              child: FilledButton(
                onPressed: () => context.pop() ,
                child: const Text("Empezar"),
              ),
            ) 
          ):const SizedBox(), //operador ternario para mostrar el boton de empezar o no


        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  
  final String title;
  final String description;
  final String imageUrl;

  const _Slide({
    required this.title, 
    required this.description, 
    required this.imageUrl, 
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge; //para darle un estilo al titulo del slide/diapositiva
    final descriptionStyle = Theme.of(context).textTheme.bodySmall; //para darle un estilo a la descripcion del slide/diapositiva

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: 
      Center(
          child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage(imageUrl)),
              const SizedBox(height: 20),
              
              Text(title, style: titleStyle),
              const SizedBox(height: 20),

              Text(description, style: descriptionStyle),
            ],
          )
        ),
      );
  }
}