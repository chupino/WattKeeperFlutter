import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wattkeeper/components/devices/details/detailsScheme.dart';
import 'package:wattkeeper/components/devices/details/header.dart';
import 'package:wattkeeper/controller/sessionController.dart';
import 'package:wattkeeper/models/Device.dart';

class DeviceDetailsPage extends StatefulWidget {
  final Device device;
  const DeviceDetailsPage({super.key, required this.device});

  @override
  State<DeviceDetailsPage> createState() => _DeviceDetailsState();
}

class _DeviceDetailsState extends State<DeviceDetailsPage> {
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              pinned: true,
              delegate: DevicesHeader(device: widget.device, size: size)),
          SliverList(
              delegate: SliverChildListDelegate([
            isInitialized
                ? DeviceDetailsScheme(
                    token: token,
                    device: widget.device,
                  )
                : Center(
                    child: Lottie.asset('assets/animations/loginLoading3.json'),
                  )
          ]))
        ],
      ),
    );
  }
}
