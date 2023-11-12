import 'package:flutter/material.dart';
import 'package:wattkeeper/core/constants/DarkColorPalette.dart';
import 'package:wattkeeper/core/constants/LightColorPalette.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';

class Themes {
  static ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: LightColorPalette.primaryColor,
      scaffoldBackgroundColor: LightColorPalette.scaffoldBackground,
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodySmall: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
      ),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStatePropertyAll(TextStyles.textH3
                  .copyWith(color: LightColorPalette.textButtons)))),
      appBarTheme:
          AppBarTheme(backgroundColor: LightColorPalette.backgroundAppBar),
      navigationBarTheme: NavigationBarThemeData(
          backgroundColor: LightColorPalette.backgroundNavBar,
          indicatorColor: LightColorPalette.selectedItemNavBar,
          shadowColor: LightColorPalette.unselectedItemNavBar),
      listTileTheme:
          ListTileThemeData(tileColor: LightColorPalette.tileBackground),
      dividerColor: LightColorPalette.dividerColor,
      iconTheme: IconThemeData(color: LightColorPalette.iconColor));

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: DarkColorPalette.primaryColor,
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      textStyle: MaterialStatePropertyAll(TextStyles.textH5),
      foregroundColor: MaterialStateProperty.all(Colors.white),
    )),
    appBarTheme:
        AppBarTheme(backgroundColor: LightColorPalette.backgroundAppBar),
    scaffoldBackgroundColor: DarkColorPalette.scaffoldBackground,
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: DarkColorPalette.backgroundNavBar,
        indicatorColor: DarkColorPalette.selectedItemNavBar,
        shadowColor: DarkColorPalette.unselectedItemNavBar),
    listTileTheme:
        ListTileThemeData(tileColor: DarkColorPalette.tileBackground),
    dividerColor: DarkColorPalette.dividerColor,
  );
}
