import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_map_initializer/screens/home/cubit/home_cubit.dart';

class DemoIntegration extends StatelessWidget {
  const DemoIntegration({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            context.read<HomeCubit>().integrateDemo();
          },
          child: const Text('Integrate Demo'),
        ),
        const SizedBox(height: 16),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Chip(
              label: const Text('Demo Integrated'),
              backgroundColor:
                  state.project.demoIntegrated ? Colors.green : Colors.grey,
            );
          },
        ),
      ],
    );
  }
}
