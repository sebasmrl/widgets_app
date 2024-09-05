import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String name = "home_screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,  //tiene la referencia al estado actual del scaffold, si tiene drawer, menu laterales, appbar
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: const _HomeView(),
      drawer: SideMenu(scaffoldkey: scaffoldKey), //paso la referencia del Scaffold al Menú
    );
  }
}


//Sub 2
class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      itemBuilder: (context, index){
        MenuItem menuItem = appMenuItems[index];
        return _CustomListTile(menuItem: menuItem);
      }
    );
  }
}


//Sub 3
class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    //final navigator = Navigator.of(context); 

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary), //icono inicial
      trailing: const Icon(Icons.arrow_forward_ios_rounded), //icono final
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subtitle),
      onTap: (){
        /* navigator.push(
          MaterialPageRoute(builder: (context){
            return const Placeholder();
          })
        ); */
        //Navigator.pushNamed( context, menuItem.link);

        //context.pushNamed(CardsScreen.name);
        context.push( menuItem.link);

      },
    );
  }
}