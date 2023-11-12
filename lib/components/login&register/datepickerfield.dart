import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';

class DatePickerTextField extends StatefulWidget {
  final String hintText;
  final String? labelText;
  final IconData? icon;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final String Function(String?)? validator;
  const DatePickerTextField(
      {super.key,
      required this.hintText,
      this.labelText,
      this.icon,
      required this.textInputType,
      this.controller,
      this.validator});

  @override
  State<DatePickerTextField> createState() => _DatePickerTextFieldState();
}

class _DatePickerTextFieldState extends State<DatePickerTextField> {
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
        readOnly: true,
        keyboardType: widget.textInputType,
        validator: widget.validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return 'Introduzca un valor';
              }
              return null;
            },
        controller: widget.controller,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1950),
              lastDate: DateTime.now());
          if (pickedDate != null) {
            setState(() {
              widget.controller!.text =
                  DateFormat('dd MMMM y', 'es').format(pickedDate);
            });
          }
        },
        style: TextStyles.textH3.copyWith(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          labelText: widget.labelText,
          hintText: widget.hintText,
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
