import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:wattkeeper/components/navBar/header.dart';
import 'package:wattkeeper/components/navBar/items.dart';
import 'package:wattkeeper/pages/devices.dart';
import 'package:wattkeeper/pages/groups.dart';
import 'package:wattkeeper/pages/home.dart';
import 'package:wattkeeper/pages/settings.dart';

class NavBarWattKeeper extends StatefulWidget {
  const NavBarWattKeeper({super.key});

  @override
  State<NavBarWattKeeper> createState() => _NavBarWattKeeperState();
}

class _NavBarWattKeeperState extends State<NavBarWattKeeper> {
  int _currentIndex = 0;
  int dummy = 0;
  void _updateIndex(int newIndex) {
    setState(() {
      _currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Get.theme.navigationBarTheme.backgroundColor,
        selectedItemColor: Colors.white,
        items: NavBarItems.items,
        currentIndex: _currentIndex,
        onTap: (i) => setState(
          () => _currentIndex = i,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          const HeaderNavBar(),
          SliverFillRemaining(
            child: IndexedStack(
              index: _currentIndex,
              children:  [
                const HomePage(),
                GroupsPage(),
                const DevicesPage(),
                const SettingsPage()
              ],
            ),
          )
        ],
      ),
    );
  }
}
