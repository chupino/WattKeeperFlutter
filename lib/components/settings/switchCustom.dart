import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class SwitchCustom extends StatelessWidget {
  final bool value;
  final Function(bool value) onToggle;
  final IconData? activeIcon, inactiveIcon;
  final Color? activeToggleColor, disabledToggleColor, activeColor;
  const SwitchCustom(
      {super.key,
      required this.value,
      required this.onToggle,
      this.activeIcon,
      this.inactiveIcon,
      this.activeToggleColor,
      this.disabledToggleColor, this.activeColor});

  @override
  Widget build(BuildContext context) {
    Color iconActiveColor = Colors.black;
    return FlutterSwitch(
      activeColor: activeColor ?? Color(0xFF1C2434),
      activeIcon: Icon(
        activeIcon,
        size: 50,
        color: iconActiveColor,
      ),
      inactiveIcon: Icon(
        inactiveIcon,
        size: 50,
      ),
      width: 50,
      height: 35,
      value: value,
      onToggle: onToggle,
      activeToggleColor: activeToggleColor,
    );
  }
}
