import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wattkeeper/controller/sessionController.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';
import 'package:wattkeeper/models/User.dart';

class WelcomeHome extends StatelessWidget {
  final String token;
  const WelcomeHome({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SessionController());
    return FutureBuilder(
        future: controller.getDataUser(token),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: LottieBuilder.asset('assets/animations/loading3.json'));
          } else if (snapshot.connectionState == ConnectionState.done) {
            final User user = snapshot.data!;
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
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Bienvenido de nuevo, ",
                              style: TextStyles.textH3.copyWith(
                                  color:
                                      Get.theme.textTheme.bodyMedium!.color)),
                          TextSpan(
                              text: user.nombres,
                              style: TextStyles.textH3
                                  .copyWith(
                                      color:
                                          Get.theme.textTheme.bodyMedium!.color)
                                  .copyWith(fontWeight: FontWeight.bold))
                        ]),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.toNamed("/inbox");
                      },
                      icon: const Icon(
                        Icons.notifications,
                        size: 40,
                      ),
                      style: Get.theme.iconButtonTheme.style,
                    )
                  ],
                ),
              ),
            );
          } else {
            print(snapshot.error);
            return Text("Algo salio brutalmente mal");
          }
        });
  }
}
