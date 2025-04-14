import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_map_initializer/screens/home/cubit/home_cubit.dart';

class ProjectSelector extends StatelessWidget {
  const ProjectSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            final path = await FilePicker.platform.getDirectoryPath();
            if (path != null) {
              context.read<HomeCubit>().selectProject(path);
            }
          },
          child: const Text('Select Flutter Project'),
        ),
        const SizedBox(height: 16),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Text(
              state.project.path ?? 'No project selected',
              style: Theme.of(context).textTheme.bodyMedium,
            );
          },
        ),
      ],
    );
  }
}
