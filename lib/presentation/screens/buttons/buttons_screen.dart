import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = "buttons_screen";
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Buttons Screen")
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: (){
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          direction: Axis.horizontal,
          children: [
            ElevatedButton(onPressed: (){}, child: const Text('Elevated Button')),

            const ElevatedButton(onPressed: null, child: Text('Disabled Button')),
            
            ElevatedButton.icon(
              icon: const Icon(Icons.access_alarm_rounded), 
              onPressed: (){}, 
              label: const Text('Elevated Icon')
            ),

            FilledButton(onPressed: (){}, child: const Text('Filled')),

            FilledButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.javascript), 
              label: const Text('Filled Icon')
            ),

            OutlinedButton(onPressed: (){}, child: const Text('OutlineBtn')),

            OutlinedButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.move_to_inbox),
              label: const Text('OutlineBtn')
            ),

            TextButton(onPressed: (){}, child: const Text('TextBtn')),

            TextButton.icon(
              onPressed: (){}, 
              icon: const Icon( Icons.shop_2_rounded),
              label: const Text('TextBtn'),
            ),

            const CustomButton(),
            const CustomButton2(),

            IconButton(onPressed: (){}, icon: const Icon(Icons.airplanemode_active_sharp)),

            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.airplanemode_active_sharp),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary),  
                iconColor: const WidgetStatePropertyAll(Colors.white)
              ) ,
            ),


          ],
        ),
      ),
    );
  }
}



class CustomButton extends StatelessWidget {
  const CustomButton({super.key});


  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Material(
        color: colors.primary,
        child: InkWell(
          splashColor: Colors.deepPurple,
          onTap: (){},
          child: const Padding(
            padding:   EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text("Hola Mundo", style:  TextStyle( color: Colors.white),),
            ),
        ),
      ),
    );
  }
}




class CustomButton2 extends StatelessWidget {
  const CustomButton2({super.key});

  @override
  Widget build(BuildContext context) {

    return  ClipRRect(
      borderRadius: BorderRadius.circular(50),
              child: 
               Container(
            height: 44.0,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 2, 173, 102), Colors.blue])),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
              child: const Text('Elevated Button', style:  TextStyle( color: Colors.white),),
            ),
          ),
      );
  }
}