import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';

class SelectGroup extends StatefulWidget {
  String selected;
  Function(String value) changeGroup;
  SelectGroup({required this.selected, required this.changeGroup, super.key});

  @override
  State<SelectGroup> createState() => _SelectGroupState();
}

class _SelectGroupState extends State<SelectGroup> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Ver:',
                    style: TextStyles.textH1,
                  ),
                  RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      tileColor: Colors.transparent,
                      title: const Text(
                        "Mis Grupos",
                        style: TextStyles.textH3,
                      ),
                      value: "Mis Grupos",
                      groupValue: widget.selected,
                      onChanged: (value) {
                        setState(() {
                          widget.selected = value!;
                          widget.changeGroup(value);
                        });
                        Get.back();
                      }),
                  RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      tileColor: Colors.transparent,
                      title: const Text(
                        "Grupos Afiliados",
                        style: TextStyles.textH3,
                      ),
                      value: "Grupos Afiliados",
                      groupValue: widget.selected,
                      onChanged: (value) {
                        setState(() {
                          widget.selected = value!;
                          widget.changeGroup(value);
                        });
                        Get.back();
                      }),
                ],
              ),
            ),
            backgroundColor: Get.theme.scaffoldBackgroundColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
            isScrollControlled: true);
      },
      child: Row(children: [
        Text(
          widget.selected,
          style: TextStyles.textH2.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 10,
        ),
        const Icon(
          Icons.arrow_drop_down,
          size: 40,
        )
      ]),
    );
  }
}
