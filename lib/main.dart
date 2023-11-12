import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:wattkeeper/controller/themeController.dart';
import 'package:wattkeeper/utils/routes.dart';
import 'package:wattkeeper/utils/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('es');
  final isDarkMode = await ThemeController().isDarkStore();
  final initalRoute = await Routes().getInitialRoute();
  runApp(MainApp(
    initialRoute: initalRoute,
    isDarkMode: isDarkMode,
  ));
}

class MainApp extends StatelessWidget {
  final bool isDarkMode;
  final String initialRoute;
  MainApp({required this.isDarkMode, super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WattsKeeper",
      initialRoute: initialRoute,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      getPages: Routes.pagesRoutes,
    );
  }
}
