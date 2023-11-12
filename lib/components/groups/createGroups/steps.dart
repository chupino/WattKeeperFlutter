import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

class StepsCreateGroup {
  static List<EasyStep> steps = [
    const EasyStep(
      icon: Icon(Icons.info),
      title: "Informacion",
      lineText: '',
    ),
    const EasyStep(
      icon: Icon(Icons.device_hub),
      title: "Dispositivos",
      lineText: '',
    ),
  ];
}
