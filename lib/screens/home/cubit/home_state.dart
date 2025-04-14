part of 'home_cubit.dart';

@immutable
sealed class HomeState {
  final ProjectModel project;
  const HomeState(this.project);
}

class HomeInitial extends HomeState {
  const HomeInitial() : super(const ProjectModel());
}

class HomeLoaded extends HomeState {
  const HomeLoaded(super.project);
}

class HomeError extends HomeState {
  final String message;
  const HomeError(super.project, this.message);
}
