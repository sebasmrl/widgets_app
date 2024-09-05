import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';


class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isDarkMode = ref.watch(isDarkModeProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            icon: (!isDarkMode) ? const Icon(Icons.light_mode): const Icon(Icons.dark_mode),
            onPressed: (){
              ref.read(isDarkModeProvider.notifier).update( (value)=> !value);
            },
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}



class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<Color> colors= ref.watch(colorListProvider);
    final int selectedColor = ref.watch(selectedIndexColorProvider); 

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index){
        final Color color = colors[index];

        return RadioListTile(
          title: Text('Texto de Ejemplo', style: TextStyle(color:color) ,),
          subtitle: Text( '${color.value}'),
          activeColor: color,
          value: index, 
          groupValue: selectedColor, 
          onChanged: (value){
            ref.read(selectedIndexColorProvider.notifier).state = value ?? 0;
          });
      } 
    );
  }
}