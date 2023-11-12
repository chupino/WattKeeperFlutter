import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wattkeeper/components/groups/groupCard.dart';
import 'package:wattkeeper/components/groups/nongroups.dart';
import 'package:wattkeeper/controller/groupController.dart';
import 'package:wattkeeper/controller/sessionController.dart';
import 'package:wattkeeper/models/Group.dart';

class GroupSection extends StatelessWidget {
  final String token;
  const GroupSection({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GroupController());
    return FutureBuilder(
        future: controller.getGroupsUser(token, "Mis Grupos"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.asset('assets/animations/loginLoading3.json'),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            final List<Group> misGrupos = snapshot.data!;
            if (misGrupos.isNotEmpty) {
              List<Widget> gruposWidget = misGrupos
                  .map((e) => GroupCard(
                      grupo: e))
                  .toList();
              return Column(children: gruposWidget);
            } else {
              return const NonGroups();
            }
          } else {
            print(snapshot.error);
            return const Text("Algo ocurrio brutalmente mal");
          }
        });
  }
}
