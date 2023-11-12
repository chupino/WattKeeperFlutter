import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:wattkeeper/components/groups/createGroups/steps.dart';

class StepperCreateGroup extends StatelessWidget {
  final int activeStep;
  const StepperCreateGroup({super.key, required this.activeStep});

  @override
  Widget build(BuildContext context) {
    Color lineColor = Color(0xFF1C2434);
    Color activeIconColor = Color(0xFF1C2434);
    Color activeBackground = Colors.white;
    Color activeBorder = Colors.white;
    Color activeText = Colors.white;
    Color finishedBackground = Colors.grey.withOpacity(0.4);
    Color finishedText = Colors.white;
    Color finishedIcon = Colors.grey;

    return EasyStepper(
      activeStep: activeStep,
      steps: StepsCreateGroup.steps,
      lineStyle: LineStyle(
          lineLength: 100,
          lineThickness: 3,
          lineSpace: 4,
          lineType: LineType.normal,
          defaultLineColor: lineColor),
      activeStepBackgroundColor: activeBackground,
      activeStepIconColor: activeIconColor,
      activeStepBorderColor: activeBorder,
      activeStepTextColor: activeText,
      finishedStepBackgroundColor: finishedBackground,
      finishedStepTextColor: finishedText,
      finishedStepIconColor: finishedIcon,
      activeStepBorderType: BorderType.normal,
      borderThickness: 10,
      internalPadding: 15,
      maxReachedStep: 1,
      showLoadingAnimation: false,
      disableScroll: false,
      enableStepTapping: false,
    );
  }
}
