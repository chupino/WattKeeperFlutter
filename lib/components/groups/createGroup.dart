import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';

class CreateGroupSection extends StatelessWidget {
  const CreateGroupSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/createGroup');
      },
      child: Row(
        children: [
          const Icon(
            Icons.add,
            size: 50,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            "Crear Grupo",
            style: TextStyles.textH2.copyWith(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
