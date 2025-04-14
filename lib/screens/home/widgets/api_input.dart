import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_map_initializer/screens/home/cubit/home_cubit.dart';

class ApiKeyInput extends StatefulWidget {
  const ApiKeyInput({super.key});

  @override
  State<ApiKeyInput> createState() => _ApiKeyInputState();
}

class _ApiKeyInputState extends State<ApiKeyInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            labelText: 'Google Maps API Key',
            hintText: 'Enter your API key',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            if (_controller.text.isNotEmpty) {
              context.read<HomeCubit>().setApiKey(_controller.text);
              context.read<HomeCubit>().integratePackage();
            }
          },
          child: const Text('Save API Key'),
        ),
      ],
    );
  }
}
