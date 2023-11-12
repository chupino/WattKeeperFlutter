import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';

class PasswordField extends StatefulWidget {
  final String hintText;
  final String? labelText;
  final TextEditingController? controller;
  final String? Function(String? value) validator;
  PasswordField({
    super.key,
    required this.hintText,
    this.labelText,
    this.controller, required this.validator,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isVisible = true;
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
        
        controller: widget.controller,
        style: TextStyles.textH3.copyWith(color: Colors.white),
        validator: widget.validator,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.password),
          suffixIcon: IconButton(
            icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
          ),
          labelText: widget.labelText,
          hintText: widget.hintText,
          hintStyle:
              TextStyles.textH6.copyWith(color: fontColor.withOpacity(0.5)),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Ajuste el relleno del contenido
          border:
              InputBorder.none, // Oculta el borde predeterminado del TextField
        ),
        obscureText: isVisible,
      ),
    );
  }
}
