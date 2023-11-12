import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wattkeeper/components/general/button.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';

class NonGroups extends StatelessWidget {
  const NonGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Lottie.asset('assets/animations/void.json', height: 200),
              const SizedBox(
                width: 10,
              ),
              const Flexible(
                child: Text(
                  'Parece que no tienes ningun grupo',
                  style: TextStyles.textH3,
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                    text: 'Unirme a uno',
                    onPressed: () {
                      Get.toNamed('/joinGroup');
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
