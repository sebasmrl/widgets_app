import 'package:flutter/material.dart';
//import 'package:widgets_app/main.dart';

class SnackbarScreen extends StatelessWidget { 

  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context){
    ScaffoldMessenger.of(context).clearSnackBars();
    final colors=Theme.of(context).colorScheme;

    final snackbar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'Ok?', onPressed: (){} ),
      duration: const Duration(milliseconds: 500),
      backgroundColor: colors.primary,
    );
    ScaffoldMessenger.of(context).showSnackBar( snackbar );
    //sm.showSnackBar( const SnackBar(content: Text('Hola mundo')));
  }


  void openDialog(BuildContext context){
    showDialog(
      barrierDismissible: false,
      //barrierColor: const Color.fromRGBO(244, 132, 49, 0.1),
      context: context,
      builder: (context)=>  AlertDialog(
        title: const Text('Estas Seguro?'),
        content: const Text('Mollit adipisicing tempor laboris labore non eiusmod reprehenderit et ullamco non.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), 
            child: const Text('Cancelar')
          ),
          FilledButton(
            onPressed: ()=> Navigator.of(context).pop(), 
            child: const Text('Aceptar')
          ),
        ],
      ), 
    );
  }





  @override
  Widget build(BuildContext context) {

    //final ScaffoldMessengerState sm = scaffoldKey.currentState!; 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialogos')
        ),
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(onPressed: (){
                showAboutDialog(
                  context: context, 
                  applicationIcon: const Icon(Icons.add_photo_alternate_rounded),
                  barrierLabel: 'Barrier Label',
                  //barrierDismissible: false,
                  applicationVersion: '1.0.0',
                  children: [
                    const Text('Aute veniam aliquip consequat sunt pariatur quis aliqua id irure elit est irure laborum.')
                  ]
                );
              }, 
                child: const Text('Lincencias Usadas')
              ),
              FilledButton(onPressed: (){
                openDialog(context);
              }, 
                child: const Text('Mostrar Dialogo de pantalla')
              )
            ],
          ),),


      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()=> {
          showCustomSnackbar(context)
        }, 
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),  
      ),
    );
  }


  

}