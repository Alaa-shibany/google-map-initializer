part of 'home_cubit.dart';

@immutable
sealed class HomeState {
  final ProjectModel project;

  const HomeState(this.project);
}

final class HomeInitial extends HomeState {}

final class HomeStepState extends HomeState {
  final bool state;

  HomeStepState({required this.state});
}
