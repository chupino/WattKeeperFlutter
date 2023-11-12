import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';

class ConsejoCard extends StatelessWidget {
  final String consejo;
  const ConsejoCard({super.key, required this.consejo});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Get.theme.primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Column(
              children: [
                Text(
                  "\"$consejo\"",
                  style: TextStyles.textH4
                      .copyWith(color: Get.theme.textTheme.bodyMedium!.color),
                )
              ],
            )),
            Icon(
              Icons.lightbulb_outline_rounded,
              size: 80,
            ),
          ],
        ),
      ),
    );
  }
}
