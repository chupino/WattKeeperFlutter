import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';

class NavBarItems{
  static final List<SalomonBottomBarItem> items = [
    SalomonBottomBarItem(
      icon: const Icon(
        FontAwesomeIcons.house,
      ),
      title: const Text(
        "Inicio",
        style: TextStyles.navBarLabel,
      ),
    ),
    SalomonBottomBarItem(
      icon: const Icon(
        // ignore: deprecated_member_use
        Icons.group,
      ),
      title: const Text("Grupos",style: TextStyles.navBarLabel,),
    ),
    SalomonBottomBarItem(
      icon: const Icon(
        Icons.devices_other_sharp,
      ),
      title: const Text("Dispositivos",style: TextStyles.navBarLabel,),
    ),
    SalomonBottomBarItem(
      icon: const Icon(
        Icons.settings,
      ),
      title: const Text("Ajustes",style: TextStyles.navBarLabel,),
    ),
  ];

}