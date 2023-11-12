// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattkeeper/core/constants/urls.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';
import 'package:wattkeeper/models/Group.dart';

class GroupCard extends StatelessWidget {
  final Group grupo;
  const GroupCard({super.key, required this.grupo});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  grupo.nombre,
                  style: TextStyles.textH4
                      .copyWith(color: Get.theme.textTheme.bodyMedium!.color),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text("${grupo.dispositivos.length} dispositivos conectados",
                    style: TextStyles.textH6.copyWith(
                        color: Get.theme.textTheme.bodyMedium!.color)),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                    onPressed: () {},
                    child: Text("Ver mas...",
                        style: TextStyles.textH4
                            .copyWith(color: Colors.blueAccent)))
              ],
            )),
            Image.network(
              grupo.getTamagochiImage(),
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
