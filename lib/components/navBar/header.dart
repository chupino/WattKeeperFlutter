import 'package:flutter/material.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';

class HeaderNavBar extends StatelessWidget {
  const HeaderNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      elevation: 0.0,
      title: Padding(
        padding: EdgeInsets.all(32.0),
        child: Center(
            child: Text(
          "WattsKeeper",
          style: TextStyles.appBarTitle,
        )),
      ),
      pinned: true,
    );
  }
}
