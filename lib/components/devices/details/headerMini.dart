import 'package:flutter/material.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';

class DevicesDetailsHeaderMini extends StatelessWidget {
  final String title;
  const DevicesDetailsHeaderMini({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyles.appBarTitle.copyWith(fontSize: 25),
            ),
            Icon(
              Icons.edit,
              size: 30,
            ),
          ],
        )),
      ),
    );
  }
}
