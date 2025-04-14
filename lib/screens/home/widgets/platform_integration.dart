import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_map_initializer/screens/home/cubit/home_cubit.dart';

class PlatformConfiguration extends StatelessWidget {
  const PlatformConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            context.read<HomeCubit>().configureAndroid();
          },
          child: const Text('Configure Android'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            context.read<HomeCubit>().configureIos();
          },
          child: const Text('Configure iOS'),
        ),
        const SizedBox(height: 16),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Chip(
                  label: const Text('Android'),
                  backgroundColor:
                      state.project.androidConfigured
                          ? Colors.green
                          : Colors.grey,
                ),
                Chip(
                  label: const Text('iOS'),
                  backgroundColor:
                      state.project.iosConfigured ? Colors.green : Colors.grey,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
