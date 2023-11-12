import 'package:flutter/material.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';

class HeaderJoinGroup extends StatelessWidget {
  const HeaderJoinGroup({super.key});

  @override
  Widget build(BuildContext context) {
        return const SliverAppBar(
      elevation: 0.0,
      title: Padding(
        padding: EdgeInsets.all(32.0),
        child: Center(
            child: Text(
          "Unirse a Grupo",
          style: TextStyles.appBarTitle,
        )),
      ),
      pinned: true,
    );
  }
}