part of track_myorder_view;

class BuildOrderStatusCard extends StatelessWidget {
  final List<Step> steps;
  final int currentStep;
  final VoidCallback onStepContinue;
  final VoidCallback onStepCancel;

  BuildOrderStatusCard({
    required this.steps,
    required this.currentStep,
    required this.onStepContinue,
    required this.onStepCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Stepper(
      steps: steps,
      currentStep: currentStep,
      onStepContinue: onStepContinue,
      onStepCancel: onStepCancel,
      physics: const BouncingScrollPhysics(),
    );
  }
}
