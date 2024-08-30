import 'dart:math' show Random;
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {

  static const name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}




class _AnimatedScreenState extends State<AnimatedScreen> {


  double _width = 150;
  double _height = 150;
  Color _color = Colors.green;
  double _borderRadius = 20;
  bool _isButtonDissabled = false;

  void cambiarFormaContenedor(){

    setState(() {
      _isButtonDissabled = true;
    });

    final random = Random();

      // Generate a random width and height.
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();

      // Generate a random color.
      _color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
      _borderRadius = random.nextInt(50).toDouble();


    setState(() {
      _isButtonDissabled = false;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,//tipo de animacion
          width: _height, 
          height: _width,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(_borderRadius)
          ),
        ) ,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isButtonDissabled ? null : cambiarFormaContenedor,
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
