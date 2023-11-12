import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattkeeper/components/settings/switchCustom.dart';
import 'package:wattkeeper/components/settings/tileCustom.dart';
import 'package:wattkeeper/controller/themeController.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ajustes',
            style: TextStyles.textH2.copyWith(fontWeight: FontWeight.bold),
          ),
          FutureBuilder(
              future: ThemeController().isDarkStore(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  bool switchValue = snapshot.data!;
                  print(snapshot.data);
                  return TileCustom(
                    icon: Icons.dark_mode,
                    title: "Modo Oscuro",
                    widgetAdj: SwitchCustom(
                      value: switchValue,
                      onToggle: (value) async {
                        setState(() {
                          Get.changeThemeMode(
                              switchValue ? ThemeMode.light : ThemeMode.dark);
                          switchValue = value;
                        });
                        await ThemeController().changeTheme(value);
                      },
                      activeIcon: Icons.dark_mode,
                      inactiveIcon: Icons.sunny,
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              }),
          const TileCustom(
            icon: Icons.account_circle_sharp,
            title: "Cuenta",
            route: '/account',
          ),
          const TileCustom(
            icon: Icons.notifications_sharp,
            title: "Notificaciones",
            route: '/notifications',
          ),
        ],
      ),
    ));
  }
}
