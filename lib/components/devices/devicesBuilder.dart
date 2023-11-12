import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wattkeeper/components/devices/deviceCard.dart';
import 'package:wattkeeper/components/devices/linkDevice.dart';
import 'package:wattkeeper/controller/deviceController.dart';
import 'package:wattkeeper/models/Device.dart';

class DevicesBuilder extends StatelessWidget {
  final String token;
  const DevicesBuilder({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DeviceController());
    return FutureBuilder(
        future: controller.getDevicesUser(token),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.asset('assets/animations/loginLoading3.json'),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            final List<Device> dispositivos = snapshot.data!;
            List<Widget> dispositivosWidget = dispositivos
                .map((e) => DeviceCard(
                      device: e,
                    ))
                .toList();
            return Column(
              children: [LinkDevice(), ...dispositivosWidget],
            );
          } else {
            print(snapshot.error);
            return Text(snapshot.error.toString());
          }
        });
  }
}
