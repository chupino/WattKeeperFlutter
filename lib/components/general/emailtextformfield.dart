import 'package:flutter/material.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';

class EmailTextFormField extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final IconData? icon;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final String Function(String?)? validator;
  const EmailTextFormField({
    super.key,
    required this.hintText,
    this.labelText,
    this.icon,
    this.controller,
    required this.textInputType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    Color background = const Color(0xFF1C2434);
    Color fontColor = Colors.white;
    return Container(
      decoration: BoxDecoration(
        color: background, // Color de fondo azul
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10)), // Bordes redondeados
        boxShadow: const [
          BoxShadow(
            color: Colors.grey, // Color de la sombra
            blurRadius: 5.0, // Radio de difuminado
          ),
        ],
      ),
      child: TextFormField(
        keyboardType: textInputType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Ingrese un correo electrónico';
          }

          final RegExp emailRegExp =
              RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

          if (!emailRegExp.hasMatch(value)) {
            return 'Ingrese un correo electrónico válido';
          }

          return null;
        },
        controller: controller,
        style: TextStyles.textH3.copyWith(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: labelText,
          hintText: hintText,
          hintStyle:
              TextStyles.textH6.copyWith(color: fontColor.withOpacity(0.5)),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Ajuste el relleno del contenido
          border:
              InputBorder.none, // Oculta el borde predeterminado del TextField
        ),
      ),
    );
  }
}
