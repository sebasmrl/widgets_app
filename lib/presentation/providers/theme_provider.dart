import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';


//Listo de colores inmutable - provee un valor que no cambia, no es un estado
final colorListProvider =  Provider((ref)=>colorList);


// Boolean value - Mantener alguna pieza de estado
final isDarkModeProvider = StateProvider((ref)=> false);

// Boolean value
final selectedIndexColorProvider = StateProvider<int>((ref)=> 0);








// Un objeto de tipo AppTheme (personalizado) - cuand el estado es un objeto mas elaborado
//   <ClaseControladoraDelEstado, TipoDeDatoDelEstado>
final themeNotifierProvider =  StateNotifierProvider<ThemeNotifier, AppTheme>( 
  (ref)=> ThemeNotifier() 
);



// controlador o notificador <T> tipo de dato que se manejara en el estado
class ThemeNotifier extends StateNotifier<AppTheme>{
  //LLamo al constructor, para que el   State =  new AppTheme() [una nueva instancia]
  ThemeNotifier(): super(AppTheme()); 


  void toggleDarkMode(){
    state = state.copyWith(  isDarkMode: !(state.isDarkMode) ); //state es la clase u objeto que se maneja como estado (AppTheme)
  }

  void changeColorIndex(int selectedColor){
    state = state.copyWith( selectedColor: selectedColor);
  }


}


