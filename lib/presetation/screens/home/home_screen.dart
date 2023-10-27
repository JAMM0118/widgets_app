import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presetation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

   final scaffoldKey = GlobalKey<ScaffoldState>(); //con esto obtenemos el estado actual del scaffold

   return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("Flutter + Material3"),
      ),
      body: const _HomeView(),
      drawer: SideMenu(scaffoldKey: scaffoldKey)//se crea un placeholder para el menu lateral por defecto se ubica a la izquierda

    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: appMenuItems.length, //cantidad de items
      
      itemBuilder: (context, index){
        final menuItem = appMenuItems[index]; //se obtiene el item
        
        return _CustomListTile(menuItem: menuItem);
      },
    ); //builder significa que va hacer en tiempo de construccion
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  
  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme; //se obtiene el color del tema de la app

    return ListTile( //se crea el item
      leading:  Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_outlined, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {

        /*
        Navigator.of(context).push( //se crea la navegacion entre pantallas
          MaterialPageRoute(
            builder: (context) => const ButtonsScreen(), //forma 1 de navegar
          ),
        );*/

        //Navigator.pushNamed(context,menuItem.link); //forma 2 de navegar entre pantallas

      //tambien se puede hacer con nombre de rutas
      //context.pushnamed(CardsScreen.routeName); 
      //forma 3 de navegar entre pantallas con go_router (se debe agregar la ruta en app_router.dart
    // o tambien se puede hacer con creando un static const String routeName = cards ; en la pantalla a la que se quiere ir
    //en este caso en cards_screen.dart se deberia crear esa variable
    
        //GoRouter.of(context).go(menuItem.link); //forma 4 de navegar entre pantallas con go_router


        context.push(menuItem.link); //forma 5 de navegar entre pantallas con go_router
      },
    );
  }
}