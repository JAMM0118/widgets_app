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
    title: "ProgressIndicators", 
    subTitle: "Generales y controlados", 
    link: "/progress", 
    icon: Icons.refresh_rounded
    ),
  
  
];
