import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wattkeeper/components/home/homeScheme.dart';
import 'package:wattkeeper/controller/sessionController.dart';
import 'package:wattkeeper/models/User.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String token;
  final controller = Get.put(SessionController());
  bool isInitialized = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initAsync();
  }

  Future<void> initAsync() async {
    token = await controller.getToken();
    print(token);
    setState(() {
      isInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: isInitialized
          ? SingleChildScrollView(child: HomeScheme(token: token))
          : Center(
              child: LottieBuilder.asset('assets/animations/loading3.json')),
    ));
  }
}
