import 'package:flutter/material.dart';

class TextStyles {
  //Fuentes
  static const String fontFamily = "Poppins";

  //Colores
  static const Color fontColor = Colors.white;

  //Tamaños
  static const double h1FontSize = 30;
  static const double h2FontSize = 27;
  static const double h3FontSize = 24;
  static const double h4FontSize = 21;
  static const double h5FontSize = 18;
  static const double h6FontSize = 15;

  //Estilos
  static const TextStyle navBarLabel = TextStyle(fontFamily: fontFamily);
  static const TextStyle appBarTitle = TextStyle(fontFamily: fontFamily);
  static const TextStyle textH1 =
      TextStyle(fontFamily: fontFamily, fontSize: h1FontSize);
  static const TextStyle textH2 =
      TextStyle(fontFamily: fontFamily, fontSize: h2FontSize);
  static const TextStyle textH3 =
      TextStyle(fontFamily: fontFamily, fontSize: h3FontSize);
  static const TextStyle textH4 =
      TextStyle(fontFamily: fontFamily, fontSize: h4FontSize);
  static const TextStyle textH5 =
      TextStyle(fontFamily: fontFamily, fontSize: h5FontSize);
  static const TextStyle textH6 =
      TextStyle(fontFamily: fontFamily, fontSize: h6FontSize);
}
