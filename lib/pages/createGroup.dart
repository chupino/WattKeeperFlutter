import 'package:flutter/material.dart';
import 'package:wattkeeper/components/groups/createGroups/firstStep.dart';
import 'package:wattkeeper/components/groups/createGroups/header.dart';
import 'package:wattkeeper/components/groups/createGroups/stepper.dart';

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({super.key});

  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  int activeStep = 0;
  void nextStep() {
    setState(() {
      activeStep++;
    });
  }

  void backStep() {
    setState(() {
      activeStep--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HeaderCreateGroup(),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  StepperCreateGroup(activeStep: activeStep),
                  activeStep == 0
                      ? Column(
                          children: [
                            const FirstStepCreateGroup(),
                            ElevatedButton(
                                onPressed: () {
                                  nextStep();
                                },
                                child: const Text("avanzar"))
                          ],
                        )
                      : Column(
                          children: [
                            const Text("paso 2"),
                            ElevatedButton(
                                onPressed: () {
                                  backStep();
                                },
                                child: const Text("retroceder"))
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
