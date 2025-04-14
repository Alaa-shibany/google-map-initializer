class ProjectModel {
  final String? path;
  final bool isValid;
  final String? googleMapsApiKey;
  final bool androidConfigured;
  final bool iosConfigured;
  final bool demoIntegrated;

  const ProjectModel({
    this.path,
    this.isValid = false,
    this.googleMapsApiKey,
    this.androidConfigured = false,
    this.iosConfigured = false,
    this.demoIntegrated = false,
  });

  ProjectModel copyWith({
    String? path,
    bool? isValid,
    String? googleMapsApiKey,
    bool? androidConfigured,
    bool? iosConfigured,
    bool? demoIntegrated,
  }) {
    return ProjectModel(
      path: path ?? this.path,
      isValid: isValid ?? this.isValid,
      googleMapsApiKey: googleMapsApiKey ?? this.googleMapsApiKey,
      androidConfigured: androidConfigured ?? this.androidConfigured,
      iosConfigured: iosConfigured ?? this.iosConfigured,
      demoIntegrated: demoIntegrated ?? this.demoIntegrated,
    );
  }
}
