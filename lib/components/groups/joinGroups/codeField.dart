import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';

class CustomCodeField extends StatefulWidget {
  CustomCodeField({super.key});

  @override
  State<CustomCodeField> createState() => _CustomCodeFieldState();
}

class _CustomCodeFieldState extends State<CustomCodeField> {
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color color = const Color(0xFF1C2434);
    return Container(
      width:
          MediaQuery.of(context).size.width / 1.7, // Ocupa la mitad del ancho
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
            hintText: "123-456",
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: color, style: BorderStyle.solid))),
        keyboardType: TextInputType.text,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9-]')),
          LengthLimitingTextInputFormatter(7),
        ],
        style: TextStyles.textH1.copyWith(fontSize: 50),
        textAlign: TextAlign.center,
      ),
    );
  }
}
