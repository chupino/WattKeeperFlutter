import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattkeeper/components/general/button.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';
import 'package:wattkeeper/models/Device.dart';
import 'package:wattkeeper/pages/deviceDetails.dart';

class DeviceCard extends StatelessWidget {
  final Device device;
  const DeviceCard({super.key, required this.device});
  void openBottomSheet(BuildContext context) {
    Get.bottomSheet(
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ID: ${device.direccionMac}",
                  style:
                      TextStyles.textH6.copyWith(fontWeight: FontWeight.w300)),
              Text(
                'Acciones',
                style: TextStyles.textH2.copyWith(fontWeight: FontWeight.bold),
              ),
              const Divider(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DeviceDetailsPage(device: device)));
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.info,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Ver Detalles',
                      style: TextStyles.textH4,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: const Row(
                  children: [
                    Icon(
                      Icons.edit,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Cambiar Nombre',
                      style: TextStyles.textH4,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: const Row(
                  children: [
                    Icon(
                      Icons.electrical_services,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Establecer Plan de Ahorro',
                      style: TextStyles.textH4,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: const Row(
                  children: [
                    Icon(
                      Icons.delete,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Eliminar',
                      style: TextStyles.textH4,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Get.theme.scaffoldBackgroundColor);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        openBottomSheet(context);
      },
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DeviceDetailsPage(device: device)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Get.theme.primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        device.nombre,
                        style: TextStyles.textH4
                            .copyWith(color: TextStyles.fontColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        device.descripcion,
                        style: TextStyles.textH6,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text.rich(TextSpan(
                          text: 'Limite de Consumo: ',
                          style: TextStyles.textH6
                              .copyWith(fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text: device.limiteConsumo,
                              style: TextStyles.textH4
                                  .copyWith(fontWeight: FontWeight.normal),
                            )
                          ]))
                    ],
                  ),
                  const Icon(
                    Icons.device_unknown,
                    size: 80,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                        text: 'Acciones',
                        onPressed: () {
                          openBottomSheet(context);
                        }),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
