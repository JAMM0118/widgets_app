import 'package:flutter/material.dart';

class MenuItem{
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon
    });

  
}

const appMenuItems = <MenuItem>[
    MenuItem(
    title: "Riverpod Counter", 
    subTitle: "Indroduccion a riverpod", 
    link: "/counter-riverpod", 
    icon: Icons.add
    ),
    
  MenuItem(
    title: "Botones", 
    subTitle: "Varios Botones en Flutter", 
    link: "/buttons", 
    icon: Icons.smart_button_outlined
    ),
  
  MenuItem(
    title: "Tarjetas", 
    subTitle: "Un contenedor estilizado", 
    link: "/cards", 
    icon: Icons.credit_card
    ),
  
  MenuItem(
    title: "Naise", 
    subTitle: "it's work", 
    link: "/nice", 
    icon: Icons.access_alarm_sharp
    ),

    MenuItem(
    title: "Progress Indicators", 
    subTitle: "Generales y controlados", 
    link: "/progress", 
    icon: Icons.refresh_rounded
    ),
    
    MenuItem(
    title: "SnackBars y dialogos", 
    subTitle: "Indicadores en pantalla", 
    link: "/snackbar", 
    icon: Icons.info_outline
    ),
  
   MenuItem(
    title: "Animated container", 
    subTitle: "Stateful widget animado", 
    link: "/animated", 
    icon: Icons.check_box_outline_blank_rounded
    ),

    MenuItem(
    title: "UI Controls + Tiles", 
    subTitle: "Una sera de controles en Flutter", 
    link: "/ui_controls", 
    icon: Icons.car_rental_outlined
    ),

    MenuItem(
    title: "Introduccion a la aplicacion", 
    subTitle: "Pequeño tutorial de introduccion", 
    link: "/app_tutorial", 
    icon: Icons.accessibility_new_rounded
    ),

    MenuItem(
    title: "InfiniteScroll y Pull", 
    subTitle: "Lista infinita y pull to refresh", 
    link: "/infinite", 
    icon: Icons.list_alt_rounded
    ),

  MenuItem(
    title: "Cambiar tema", 
    subTitle: "Cambiar tema de la aplicacion", 
    link: "/theme-changer", 
    icon: Icons.color_lens_outlined
    ),
  
  
  
  
];
