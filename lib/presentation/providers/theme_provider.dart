import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Listo de colores inmutable
final colorListProvider =  Provider((ref)=>colorList);

// Boolean value
final isDarkModeProvider = StateProvider((ref)=> false);


// Boolean value
final selectedIndexColorProvider = StateProvider<int>((ref)=> 0);



