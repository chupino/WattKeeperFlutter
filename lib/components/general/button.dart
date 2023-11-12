import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            padding:
                MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 10)),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(15),
              )),
            ),
            backgroundColor:
                MaterialStatePropertyAll(Get.theme.scaffoldBackgroundColor)),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.textH3,
        ));
  }
}
