
import 'package:flutter/material.dart';

const cards = <Map<String,dynamic>>[
    {"elevation" : 0.0 , "label": "Elevation 0"},
    {"elevation" : 1.0 , "label": "Elevation 1"},
    {"elevation" : 2.0 , "label": "Elevation 2"},
    
    {"elevation" : 3.0 , "label": "Elevation 3"},
    
    {"elevation" : 4.0 , "label": "Elevation 4"},
    
    {"elevation" : 5.0 , "label": "Elevation 5"},
    
];

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards Screen"),
      ),
      body: const _CardsView(),
     
  );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: Column(
        children: [
          ...cards.map((card) => _CarType1( //los tres ... sirve para que se despliegue la lista de cards
            label: card["label"], 
            elevation: card["elevation"]
            )
          ),
    
          ...cards.map((card) => _CarType2( //los tres ... sirve para que se despliegue la lista de cards
            label: card["label"], 
            elevation: card["elevation"]
            )
          ),

          
          ...cards.map((card) => _CarType3( //los tres ... sirve para que se despliegue la lista de cards
            label: card["label"], 
            elevation: card["elevation"]
            )
          ),
            ...cards.map((card) => _CarType4( //los tres ... sirve para que se despliegue la lista de cards
            label: card["label"], 
            elevation: card["elevation"]
            )
          ),
          
          
          
          const SizedBox(height: 50),
              
          
        ],
      ),
    );
  }
}


class _CarType1 extends StatelessWidget {
  final String label;
  final double elevation;
  
  const _CarType1({
    required this.label,
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {
    return Card( //sirve para crear un card que le da un diseño a ese card
      elevation: elevation, //se da la elevacion al card que sirve para darle sombra
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10,10), //se da un padding al card
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.more_vert_outlined)  //se agrega un icono
              )
            ),
            Align(
              alignment:Alignment.bottomLeft,
              child: Text(label),
            ),
          ]
        ),
      
      )
    );
  }
}

class _CarType2 extends StatelessWidget {
  final String label;
  final double elevation;
  
  const _CarType2({
    required this.label,
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme; //se obtiene el color del tema de la app

    return Card( //sirve para crear un card que le da un diseño a ese card

      shape: RoundedRectangleBorder( //sirve para darle una forma al card

        borderRadius: const BorderRadius.all(Radius.circular(20)), //se le da un radio al card

        side: BorderSide( //sirve para darle un borde al card
          color : colors.outline
        )
      ),
      elevation: elevation, //se da la elevacion al card que sirve para darle sombra
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10,10), //se da un padding al card
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.more_vert_outlined)  //se agrega un icono
              )
            ),
            Align(
              alignment:Alignment.bottomLeft,
              child: Text("$label - outlined"),
            ),
          ]
        ),
      
      )
    );
  }
}

class _CarType3 extends StatelessWidget {
  final String label;
  final double elevation;
  
  const _CarType3({
    required this.label,
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card( //sirve para crear un card que le da un diseño a ese card
      color: colors.surfaceVariant, //se le da un color a la superficie del card
      elevation: elevation, //se da la elevacion al card que sirve para darle sombra
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10,10), //se da un padding al card
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.more_vert_outlined)  //se agrega un icono
              )
            ),
            Align(
              alignment:Alignment.bottomLeft,
              child: Text("$label - Filled"),
            ),
          ]
        ),
      
      )
    );
  }
}

class _CarType4 extends StatelessWidget {
  final String label;
  final double elevation;
  
  const _CarType4({
    required this.label,
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {

    return Card( //sirve para crear un card que le da un diseño a ese card
      
      clipBehavior: Clip.hardEdge, //sirve para que la imagen se recorte al tamaño del card

      elevation: elevation, //se da la elevacion al card que sirve para darle sombra
      child: Stack(
        children: [

          Image.network(
            "https://picsum.photos/id/${elevation.toInt()}/600/250",
            height: 350, //se le da un alto a la imagen
            fit: BoxFit.cover //para que la imagen tome todo el espacio del disponible del card en la pantalla
          ),

          Align(
            alignment: Alignment.topRight,
            child: Container(
              //magia de flutter :V
              decoration: const BoxDecoration(
                color: Colors.white, //se le da un color al container
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
                 //se le da un radio al container solo abajo-izquierda

              ),
              child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.more_vert_outlined)  //se agrega un icono
              ),
            )
          ),
         
        ]
      )
    );
  }
}