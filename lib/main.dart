import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';
//import 'package:widgets_app/config/theme/app_theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp()
    )
  );
}

//final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

class MainApp extends ConsumerWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final bool isDarkMode = ref.watch(isDarkModeProvider);
    //final int colorSelected =  ref.watch(selectedIndexColorProvider);
    final appTheme = ref.watch(themeNotifierProvider);

    return  MaterialApp.router(
      //scaffoldMessengerKey: scaffoldKey,
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme()   //AppTheme( selectedColor: colorSelected, isDarkMode: isDarkMode).getTheme(),
    );
  }
}