import 'package:vpn_wireguard_stub/infrastructure/core/models/app_dependencies.dart';

sealed class AppDependenciesState {}

final class AppDependenciesInitial implements AppDependenciesState {}

final class AppDependenciesLoading implements AppDependenciesState {
  AppDependenciesLoading({
    required this.progressPercent,
    required this.description,
  });

  final double progressPercent;
  final String description;
}

final class AppDependenciesSuccess implements AppDependenciesState {
  AppDependenciesSuccess({required this.appDependencies});

  final AppDependencies appDependencies;
}
