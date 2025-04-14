import 'package:flutter/material.dart';

class StepperControls extends StatelessWidget {
  final VoidCallback? onStepContinue;
  final VoidCallback? onStepCancel;
  final int stepIndex;

  const StepperControls({
    super.key,
    required this.onStepContinue,
    required this.onStepCancel,
    required this.stepIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          if (stepIndex > 0)
            TextButton(onPressed: onStepCancel, child: const Text('BACK')),
          const Spacer(),
          ElevatedButton(onPressed: onStepContinue, child: const Text('NEXT')),
        ],
      ),
    );
  }
}
