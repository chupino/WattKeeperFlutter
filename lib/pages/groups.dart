import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wattkeeper/components/groups/groupsBuilder.dart';
import 'package:wattkeeper/components/groups/joinGroup.dart';
import 'package:wattkeeper/components/groups/selectGroup.dart';
import 'package:wattkeeper/controller/sessionController.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  final controller = Get.put(SessionController());
  String groupSelected = "Mis Grupos";
  late String token;
  bool isInitialized = false;
  Future<void> initAsync() async {
    token = await controller.getToken();
    print(token);
    setState(() {
      isInitialized = true;
    });
  }

  @override
  void initState() {
    super.initState();
    initAsync();
  }

  @override
  Widget build(BuildContext context) {
    void changeGroup(String value) {
      setState(() {
        groupSelected = value;
      });
    }

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: isInitialized
          ? SingleChildScrollView(
            
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const JoinGroupSection(),
                  const SizedBox(
                    height: 20,
                  ),
                  SelectGroup(
                    selected: groupSelected,
                    changeGroup: changeGroup,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GroupsBuilder(selectedGroup: groupSelected, token: token)
                ],
              ),
          )
          : Center(
              child: LottieBuilder.asset('assets/animations/loading3.json')),
    ));
  }
}
