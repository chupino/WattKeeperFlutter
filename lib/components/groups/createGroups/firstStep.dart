import 'package:flutter/material.dart';
import 'package:wattkeeper/components/general/textfield.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';

class FirstStepCreateGroup extends StatelessWidget {
  const FirstStepCreateGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Nombre del Grupo",
          style: TextStyles.textH2,
        ),
        SizedBox(
          height: 10,
        ),
        TextFieldCustom(
          hintText: "Ingrese el nombre del grupo",
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Descripción del Grupo",
          style: TextStyles.textH2,
        ),
        SizedBox(
          height: 10,
        ),
        TextFieldCustom(
          hintText: "Ingrese la descripción del grupo",
        ),
        Text(
          "Icono del Grupo",
          style: TextStyles.textH2,
        ),
        
      ],
    );
  }
}
