import 'package:flutter/material.dart' show IconData, Icons;

class MenuItem{

  final String title, subtitle, link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subtitle, 
    required this.link, 
    required this.icon
  });


}
  const appMenuItems = <MenuItem>[
    MenuItem(
      title: 'Botones', 
      subtitle: 'Varios tipos de botones en Flutter', 
      link: '/buttons', 
      icon: Icons.smart_button_outlined
    ),
    MenuItem(
      title: 'Tarjetas', 
      subtitle: 'Un contenedor estilizado', 
      link: '/cards', 
      icon: Icons.credit_card
    ),
    
  ];