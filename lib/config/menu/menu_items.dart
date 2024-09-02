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
    MenuItem(
      title: 'Indicador de Progreso', 
      subtitle: 'Generales y controlados', 
      link: '/progress', 
      icon: Icons.refresh_rounded
    ),
    MenuItem(
      title: 'Snackbars y dialogos', 
      subtitle: 'Indicadores/alertas en pantalla', 
      link: '/snackbars', 
      icon: Icons.info_outline
    ),
    MenuItem(
      title: 'Animated Container', 
      subtitle: 'Stateful Widget Animado', 
      link: '/animated', 
      icon: Icons.check_box_outlined
    ),
    MenuItem(
      title: 'Ui Controls', 
      subtitle: 'Controles de ui', 
      link: '/ui-controls', 
      icon: Icons.album_outlined
    ),
    MenuItem(
      title: 'Tutorial', 
      subtitle: 'Ingresar al tutorial de la aplicación', 
      link: '/tutorial', 
      icon: Icons.add_home_outlined
    ),
    
  ];