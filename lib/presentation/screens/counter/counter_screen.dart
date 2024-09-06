import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = "counter_screen";
  const CounterScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final clickCounter = ref.watch<int>(counterProvider);
    final bool darkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        leading: IconButton(
          onPressed: (){
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            icon: (!darkMode) ? const Icon(Icons.light_mode): const Icon(Icons.dark_mode),
            onPressed: (){
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FlutterLogo(),
          Center(child: Text('Counter: $clickCounter', style:  Theme.of(context).textTheme.titleLarge ,))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed:(){
          //ref.read(counterProvider.notifier).state++;
          ref.read(counterProvider.notifier).update( (state)=> state+1);
        } ,
        ),
    );
  }
}