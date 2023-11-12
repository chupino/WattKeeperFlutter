import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wattkeeper/components/devices/deviceCard.dart';
import 'package:wattkeeper/components/devices/devicesBuilder.dart';
import 'package:wattkeeper/controller/deviceController.dart';
import 'package:wattkeeper/controller/sessionController.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';

class DevicesPage extends StatefulWidget {
  const DevicesPage({super.key});

  @override
  State<DevicesPage> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  late String token;
  final controller = Get.put(SessionController());
  bool isInitialized = false;
  Future<void> initAsync() async {
    token = await controller.getToken();
    print(token);
    setState(() {
      isInitialized = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initAsync();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dispositivos',
            style: TextStyles.textH2.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          isInitialized
              ? DevicesBuilder(token: token)
              : Center(
                  child: Lottie.asset('assets/animations/loginLoading3.json'),
                )
        ],
      ),
    ));
  }
}
