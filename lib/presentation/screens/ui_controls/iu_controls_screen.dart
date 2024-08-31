import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {

  static const name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Ui Control'),
      ),
      body: const _UiControlsView(),
    );
  }
}



class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation{ carro, avion, bote, submarino, moto}

class _UiControlsViewState extends State<_UiControlsView> {

  bool isDeveloper =true;
  Transportation? selectedTransportation = Transportation.carro;
  bool quiereDesayuno = false;
  bool quiereAlmuerzo = false;
  bool quiereCena = false;


  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [ 
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('COntroles adicionales'),
          value: isDeveloper, 
          onChanged: (value){
            setState(() {
              isDeveloper  = !isDeveloper; 
            });
        }),

        ExpansionTile(
          title: const Text('Vehiculo de transporte'),
          subtitle: Text( '$selectedTransportation'.split('.')[1]),
          shape:  Border( left: BorderSide(width: 10, color: colors.primary)),
          children: [
            RadioListTile(
              title: const Text('Comprar Carro'),
              subtitle: const Text('Viajar por carro'),
              value: Transportation.carro, 
              groupValue: selectedTransportation, 
              onChanged: (value){
                setState(() {
                  selectedTransportation = Transportation.carro;
                });
              }
            ),
            RadioListTile(
              title: const Text('Comprar Avion'),
              subtitle: const Text('viajar por avion'),
              value: Transportation.avion, 
              groupValue: selectedTransportation, 
              onChanged: (value){
                setState(() {
                  selectedTransportation = Transportation.avion;
                });
              }
            ),
            RadioListTile(
              title: const Text('Comprar Bote'),
              subtitle: const Text('Viajar por bote'),
              value: Transportation.bote, 
              groupValue: selectedTransportation, 
              onChanged: (value){
                setState(() {
                  selectedTransportation = Transportation.bote;
                });
              }
            ),
            RadioListTile(
              title: const Text('Comprar Moto'),
              subtitle: const Text('Viajar con moto'),
              value: Transportation.moto, 
              groupValue: selectedTransportation, 
              onChanged: (value){
                setState(() {
                  selectedTransportation = Transportation.moto;
                });
              }
            ),
            RadioListTile(
              title: const Text('Comprar Submarino'),
              subtitle: const Text('Viajar en submarino'),
              value: Transportation.submarino, 
              groupValue: selectedTransportation, 
              onChanged: (value){
                setState(() {
                  selectedTransportation = Transportation.submarino;
                });
              }
            ),
          ],
        ),

        CheckboxListTile(
          title: const Text('¿Quiere incluir Desayuno?'),
          value: quiereDesayuno, 
          onChanged: (value) => setState(() {
            quiereDesayuno = !quiereDesayuno;
          }),
        ),
        CheckboxListTile(
          title: const Text('¿Quiere incluir Almuerzo?'),
          value: quiereAlmuerzo, 
          onChanged: (value) => setState(() {
            quiereAlmuerzo = !quiereAlmuerzo;
          }),
        ),
        CheckboxListTile(
          title: const Text('¿Quiere incluir Cena?'),
          value: quiereCena, 
          onChanged: (value) => setState(() {
            quiereCena = !quiereCena;
          }),
        ),
      ],
    );
  }
}