import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattkeeper/components/general/button.dart';
import 'package:wattkeeper/components/groups/joinGroups/codeField.dart';
import 'package:wattkeeper/components/groups/joinGroups/header.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';

class JoinGroupPage extends StatelessWidget {
  const JoinGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HeaderJoinGroup(),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    "Introduce codigo de grupo",
                    style: TextStyles.textH2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomCodeField(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(text: 'Aceptar', onPressed: (){
                          
                        }),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
