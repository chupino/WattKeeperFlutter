import 'package:flutter/material.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';

class HeaderInbox extends StatelessWidget {
  const HeaderInbox({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      elevation: 0.0,
      title: Padding(
        padding: EdgeInsets.all(32.0),
        child: Center(
            child: Text(
          "Bandeja de Notificaciones",
          style: TextStyles.appBarTitle,
        )),
      ),
      pinned: true,
    );
  }
}