import 'package:bloc/bloc.dart';
import 'package:google_map_initializer/models/project_model.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:yaml/yaml.dart';
import 'dart:io';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void selectProject(String? projectPath) async {
    if (projectPath == null) {
      emit(HomeError(state.project, 'No project selected'));
      return;
    }
    final pubspecPath = path.join(projectPath, 'pubspec.yaml');
    final file = File(pubspecPath);
    if (!await file.exists()) {
      emit(
        HomeError(state.project, 'Selected folder is not a Flutter project'),
      );
      return;
    }
    try {
      final content = await file.readAsString();
      final yaml = loadYaml(content);
      if (yaml['name'] == null) {
        emit(HomeError(state.project, 'Invalid pubspec.yaml'));
        return;
      }
      final newProject = state.project.copyWith(
        path: projectPath,
        isValid: true,
      );
      emit(HomeLoaded(newProject));
    } catch (e) {
      emit(HomeError(state.project, 'Error reading project: $e'));
    }
  }

  void setApiKey(String apiKey) {
    if (state.project.path == null) return;

    emit(HomeLoaded(state.project.copyWith(googleMapsApiKey: apiKey)));
  }

  Future<void> integratePackage() async {
    if (state.project.path == null || !state.project.isValid) return;

    try {
      final pubspecFile = File(path.join(state.project.path!, 'pubspec.yaml'));
      final content = await pubspecFile.readAsString();

      if (!content.contains('google_maps_flutter:')) {
        final updatedContent = content.replaceFirst(
          'dependencies:\n',
          'dependencies:\n  google_maps_flutter: ^2.2.0\n',
        );
        await pubspecFile.writeAsString(updatedContent);

        final process = await Process.start('flutter', [
          'pub',
          'get',
        ], workingDirectory: state.project.path);
        await process.exitCode;
      }

      emit(HomeLoaded(state.project));
    } catch (e) {
      emit(HomeError(state.project, 'Error integrating package: $e'));
    }
  }

  Future<void> configureAndroid() async {
    if (state.project.path == null ||
        !state.project.isValid ||
        state.project.googleMapsApiKey == null) {
      return;
    }

    try {
      final manifestPath = path.join(
        state.project.path!,
        'android/app/src/main/AndroidManifest.xml',
      );
      final manifestFile = File(manifestPath);

      if (await manifestFile.exists()) {
        var content = await manifestFile.readAsString();

        if (!content.contains('com.google.android.geo.API_KEY')) {
          final metaData = '''
            <meta-data
              android:name="com.google.android.geo.API_KEY"
              android:value="${state.project.googleMapsApiKey}" />
          ''';

          content = content.replaceFirst(
            '<application',
            '<application\n$metaData',
          );

          await manifestFile.writeAsString(content);
        }
      }

      emit(HomeLoaded(state.project.copyWith(androidConfigured: true)));
    } catch (e) {
      emit(HomeError(state.project, 'Error configuring Android: $e'));
    }
  }

  Future<void> configureIos() async {
    if (state.project.path == null ||
        !state.project.isValid ||
        state.project.googleMapsApiKey == null) {
      return;
    }

    try {
      // For iOS, we'll modify AppDelegate.swift
      final appDelegatePath = path.join(
        state.project.path!,
        'ios/Runner/AppDelegate.swift',
      );
      final appDelegateFile = File(appDelegatePath);

      if (await appDelegateFile.exists()) {
        var content = await appDelegateFile.readAsString();

        if (!content.contains('GMSServices.provideAPIKey')) {
          final apiKeyCode = '''
          GMSServices.provideAPIKey("${state.project.googleMapsApiKey}")
          ''';

          content = content.replaceFirst(
            'GeneratedPluginRegistrant.register(with: self)',
            'GeneratedPluginRegistrant.register(with: self)\n\t\t$apiKeyCode',
          );

          await appDelegateFile.writeAsString(content);
        }
      }

      emit(HomeLoaded(state.project.copyWith(iosConfigured: true)));
    } catch (e) {
      emit(HomeError(state.project, 'Error configuring iOS: $e'));
    }
  }

  Future<void> integrateDemo() async {
    if (state.project.path == null || !state.project.isValid) return;

    try {
      final mainPath = path.join(state.project.path!, 'lib/main.dart');
      final mainFile = File(mainPath);

      if (await mainFile.exists()) {
        const demoContent = '''
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Google Maps Demo')),
        body: const GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(0, 0),
            zoom: 2,
          ),
        ),
      ),
    );
  }
}
        ''';

        await mainFile.writeAsString(demoContent);
      }

      emit(HomeLoaded(state.project.copyWith(demoIntegrated: true)));
    } catch (e) {
      emit(HomeError(state.project, 'Error integrating demo: $e'));
    }
  }
}
