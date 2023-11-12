import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wattkeeper/components/general/textfield.dart';
import 'package:wattkeeper/components/settings/switchCustom.dart';
import 'package:wattkeeper/controller/deviceController.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';
import 'package:wattkeeper/models/Device.dart';
import 'package:wattkeeper/models/DeviceDetails.dart';

class DeviceDetailsScheme extends StatefulWidget {
  final String token;
  final Device device;
  const DeviceDetailsScheme(
      {super.key, required this.token, required this.device});

  @override
  State<DeviceDetailsScheme> createState() => _DeviceDetailsSchemeState();
}

class _DeviceDetailsSchemeState extends State<DeviceDetailsScheme> {
  bool isInitialized = false;
  late DeviceDetails deviceDetails;
  TextEditingController descriptionController = TextEditingController();
  TextEditingController tiempoMedicionController = TextEditingController();
  late bool enabled;
  final controller = Get.put(DeviceController());
  void getData() async {
    deviceDetails =
        await controller.getDeviceDetailsUser(widget.token, widget.device.id);
    descriptionController.text = deviceDetails.descripcion;
    tiempoMedicionController.text = deviceDetails.tiempoMedicion.toString();
    enabled = deviceDetails.enabled;
    setState(() {
      isInitialized = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    Column limitacionWidgets() {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Limite Consumo', style: TextStyles.textH5), //slider

              Slider(
                  value: deviceDetails.limiteConsumo / 5000,
                  onChanged: (value) {}),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tiempo Medición',
                style: TextStyles.textH5,
              ), //subir bajar
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        int intTiempoMedicion =
                            int.parse(tiempoMedicionController.text);
                        intTiempoMedicion++;
                        setState(() {
                          tiempoMedicionController.text =
                              intTiempoMedicion.toString();
                        });
                      },
                      icon: const Icon(Icons.add)),
                  SizedBox(
                      width: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: tiempoMedicionController,
                      )),
                  IconButton(
                      onPressed: () {
                        int intTiempoMedicion =
                            int.parse(tiempoMedicionController.text);
                        intTiempoMedicion--;
                        setState(() {
                          tiempoMedicionController.text =
                              intTiempoMedicion.toString();
                        });
                      },
                      icon: const Icon(Icons.remove)),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Tipo Medición', style: TextStyles.textH5), //dropdown
              DropdownButton(items: const [
                DropdownMenuItem(child: Text("Nose")),
              ], onChanged: (value) {})
            ],
          ),
        ],
      );
    }

    return isInitialized
        ? SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text.rich(TextSpan(
                      text: "ID: ",
                      style: TextStyles.textH6
                          .copyWith(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text: deviceDetails.direccionMac,
                            style: TextStyles.textH6
                                .copyWith(fontWeight: FontWeight.normal))
                      ])),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldCustom(
                    hintText: 'Descripcion',
                    labelText: 'Descripción',
                    icon: Icons.description,
                    controller: descriptionController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        color: Get.theme.primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Limitación",
                            style: TextStyles.textH3
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SwitchCustom(
                              activeToggleColor:
                                  Get.theme.scaffoldBackgroundColor,
                              activeColor: Colors.blueAccent,
                              value: enabled,
                              onToggle: (value) {
                                setState(() {
                                  enabled = value;
                                });
                              })
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      enabled ? limitacionWidgets() : Container()
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        color: Get.theme.primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Image.network(
                          widget.device.getTamagochiImage(),
                          height: 200,
                          width: double.infinity,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text.rich(TextSpan(
                            text: 'Recompensa 1: ',
                            style: TextStyles.textH3,
                            children: [
                              TextSpan(
                                  text: 'Doritos',
                                  style: TextStyles.textH3
                                      .copyWith(fontWeight: FontWeight.bold))
                            ])),
                        Text.rich(TextSpan(
                            text: 'Recompensa 2: ',
                            style: TextStyles.textH3,
                            children: [
                              TextSpan(
                                  text: 'Doritos',
                                  style: TextStyles.textH3
                                      .copyWith(fontWeight: FontWeight.bold))
                            ])),
                        Text.rich(TextSpan(
                            text: 'Recompensa 3: ',
                            style: TextStyles.textH3,
                            children: [
                              TextSpan(
                                  text: 'Doritos',
                                  style: TextStyles.textH3
                                      .copyWith(fontWeight: FontWeight.bold))
                            ])),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        : Center(
            child: Lottie.asset(
              'assets/animations/loginLoading3.json',
            ),
          );
  }
}
