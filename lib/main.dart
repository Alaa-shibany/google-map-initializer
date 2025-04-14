import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_map_initializer/screens/home/cubit/home_cubit.dart';
import 'package:google_map_initializer/screens/home/widgets/api_input.dart';
import 'package:google_map_initializer/screens/home/widgets/demo_integration.dart';
import 'package:google_map_initializer/screens/home/widgets/pick_project_widget.dart';
import 'package:google_map_initializer/screens/home/widgets/platform_integration.dart';
import 'package:google_map_initializer/screens/home/widgets/stepper_controll.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Package Integrator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (context) => HomeCubit(),
        child: const MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Maps Package Integrator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                currentStep: _getCurrentStep(context),
                controlsBuilder: (context, details) {
                  return StepperControls(
                    onStepContinue: details.onStepContinue,
                    onStepCancel: details.onStepCancel,
                    stepIndex: details.currentStep,
                  );
                },
                steps: [
                  Step(
                    title: const Text('Select Project'),
                    content: const ProjectSelector(),
                    isActive: true,
                    state: _getStepState(context, 0),
                  ),
                  Step(
                    title: const Text('API Key'),
                    content: const ApiKeyInput(),
                    isActive: true,
                    state: _getStepState(context, 1),
                  ),
                  Step(
                    title: const Text('Platform Configuration'),
                    content: const PlatformConfiguration(),
                    isActive: true,
                    state: _getStepState(context, 2),
                  ),
                  Step(
                    title: const Text('Demo Integration'),
                    content: const DemoIntegration(),
                    isActive: true,
                    state: _getStepState(context, 3),
                  ),
                ],
              ),
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeError) {
                  return Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }

  int _getCurrentStep(BuildContext context) {
    final state = context.read<HomeCubit>().state.project;

    if (!state.demoIntegrated) {
      if (!state.androidConfigured || !state.iosConfigured) {
        if (state.googleMapsApiKey == null) {
          if (!state.isValid) {
            return 0;
          }
          return 1;
        }
        return 2;
      }
      return 3;
    }
    return 3;
  }

  StepState _getStepState(BuildContext context, int stepIndex) {
    final currentStep = _getCurrentStep(context);
    // final state = context.read<HomeCubit>().state.project;

    if (stepIndex < currentStep) {
      return StepState.complete;
    } else if (stepIndex == currentStep) {
      return StepState.indexed;
    } else {
      return StepState.disabled;
    }
  }
}
