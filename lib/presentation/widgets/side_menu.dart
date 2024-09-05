import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldkey;
  const SideMenu({super.key, required this.scaffoldkey}); //referencia desde el scaffold

  @override
  State<SideMenu> createState() => _SideMenuState();
}


class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0; //opcion que tiene seleccionada por defecto


  @override
  Widget build(BuildContext context) {
    
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    Platform.isAndroid;


    return  NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value){ 
          setState(() {
            navDrawerIndex = value; 
          });

          final menuItem = appMenuItems[value];
          context.push(menuItem.link);
          widget.scaffoldkey.currentState?.closeDrawer() ; //hacer referencia a a las propiedad del Menu, porque aquí se está dentro del estado del Menú 
        },

        children:  [

          Padding(
            padding:  EdgeInsets.fromLTRB(28, hasNotch ? 10 : 30, 10, 12),
            child:  const Text('Principales'), 
          ),

          ...appMenuItems
              .sublist(0,3)
              .map( (menu)=> NavigationDrawerDestination(
                  icon:  Icon(menu.icon), 
                  label: Text(menu.title),
          )),


          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),

          const Padding(
            padding:  EdgeInsets.fromLTRB(28, 10, 16  , 12),
            child:   Text('Otras opciones'), 
          ),

          ...appMenuItems
              .sublist(3)
              .map( (menu)=> NavigationDrawerDestination(
                  icon:  Icon(menu.icon), 
                  label: Text(menu.title)
          )),

         
        ]
      );
  }
}