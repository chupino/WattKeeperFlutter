import 'package:flutter/material.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';
import 'package:wattkeeper/models/Device.dart';

class DeviceDetailsExpandedHeader extends StatelessWidget {
  final Device device;
  const DeviceDetailsExpandedHeader({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
            child: Column(
          children: [
            Text(
              device.nombre,
              style: TextStyles.appBarTitle.copyWith(fontSize: 40),
            ),
            Flexible(
              child: const Icon(
                Icons.devices,
                size: 200,
              ),
            )
          ],
        )),
      ),
    );
    ;
  }
}
