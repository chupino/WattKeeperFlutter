import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';

class JoinGroupSection extends StatelessWidget {
  const JoinGroupSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/joinGroup');
      },
      child: Row(
        children: [
          const Icon(
            Icons.arrow_right,
            size: 50,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            "Unirse a Grupo",
            style: TextStyles.textH2.copyWith(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
