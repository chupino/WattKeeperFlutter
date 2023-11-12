import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';

class LinkDevice extends StatelessWidget {
  const LinkDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/joinGroup');
      },
      child: Row(
        children: [
          const Icon(
            Icons.add_link,
            size: 50,
          ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            child: Text(
              "Vincular Nuevo Dispositivo",
              style: TextStyles.textH2.copyWith(fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
