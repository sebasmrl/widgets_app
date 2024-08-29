import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {

  static const name = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ), 
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30,),
          Text('Circular Progress Indicator'),
          SizedBox(height: 10,),
          CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.black26,),

          SizedBox(height: 20,),
          Text('Circular y Linear Progress Indicator Controlado'),
          SizedBox(height: 10,),
          _ControllerProgressIndicator(),





        ],
      ),
    );
  }
}


class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator();

  @override
  Widget build(BuildContext context) {

  
    return StreamBuilder(
      stream: Stream.periodic( const Duration(milliseconds: 300), (value){
        // ignore: avoid_print
        print(value);
        return { 'devolucion':(value*2)/100};
      }).takeWhile( (value)=> (value['devolucion'] ?? 0) < 1.02),

      builder: (context, snapshot){ 
        final progressValue = snapshot.data?['devolucion'] ?? 0;
        return   Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator( value: progressValue, strokeWidth: 2, backgroundColor: Colors.black26,),
              Expanded(
                child: LinearProgressIndicator(value:progressValue)
              ),
              const SizedBox(width: 20,)
            ],
          ),  
        );
      }
    );
  }
}



