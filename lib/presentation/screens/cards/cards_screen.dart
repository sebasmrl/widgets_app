import 'package:flutter/material.dart';

const  cards = <Map<String, dynamic>>[
  { 'elevation': 0.0, 'label':'Elevation 0' },
  { 'elevation': 1.0, 'label':'Elevation 1' },
  { 'elevation': 2.0, 'label':'Elevation 2' },
  { 'elevation': 3.0, 'label':'Elevation 3' },
  { 'elevation': 4.0, 'label':'Elevation 4' },
  { 'elevation': 5.0, 'label':'Elevation 5' },
];


class CardsScreen extends StatelessWidget {
  static const String name = "cards_screen";
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Cards Screen")
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map(
            (cardData) => _CardType1(label: cardData['label'], elevation: cardData['elevation'])
          ),
          ...cards.map(
            (cardData) => _CardType2(label: cardData['label'], elevation: cardData['elevation'])
          ),
          ...cards.map(
            (cardData) => _CardType3(label: cardData['label'], elevation: cardData['elevation'])
          ),
          ...cards.map(
            (cardData) => _CardType4(label: cardData['label'], elevation: cardData['elevation'])
          ),

          const SizedBox( height:50)
        ],
      ),
    );
  }
}



class _CardType1 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType1({
    required this.label, 
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation, //shadow bottom
      child:  Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton( 
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: (){}
              )
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label)
            )
          ],
          )
        ),
    );
  }
}



class _CardType2 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType2({
    required this.label, 
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10)),
        side: BorderSide(
          color: colors.outline
        )
      ),
      elevation: elevation, //shadow bottom
      child:  Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton( 
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: (){}
              )
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - outline')
            )
          ],
          )
        ),
    );
  }
}





class _CardType3 extends StatelessWidget {

  final String label; 
  final double elevation;

  const _CardType3({
    required this.label, 
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.tertiaryFixedDim,
      elevation: elevation, //shadow bottom
      child:  Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton( 
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: (){}
              )
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - Filled')
            )
          ],
          )
        ),
    );
  }
}



class _CardType4 extends StatelessWidget {

  final String label; 
  final double elevation;

  const _CardType4({
    required this.label, 
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {

    return Card( //la forma natural de las card es redondeado
      clipBehavior: Clip.hardEdge, //evita que los hijos se salgan o deborden
      elevation: elevation, //shadow bottom
      child:  Stack(
        children: [
          Image.network('http://picsum.photos/id/${elevation.toInt()}/600/250',
            height: 350,
            fit: BoxFit.cover
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10))
              ),
              child: IconButton( 
                icon: const Icon(Icons.more_vert_outlined, ),
                onPressed: (){}
              ),
            )
          ),
          
        ],
        ),
    );
  }
}