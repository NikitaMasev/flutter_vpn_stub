import 'package:flutter/material.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/models/initial_dependencies.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/notifiers/app_dependencies_notifier.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/notifiers/theme_mode_notifier.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/providers/app_dependencies_provider.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/providers/theme_mode_provider.dart';

class AppScope extends StatefulWidget {
  const AppScope({
    required this.initialDependencies,
    required this.child,
    super.key,
  });

  final InitialDependencies initialDependencies;
  final Widget child;

  @override
  State<AppScope> createState() => _AppScopeState();
}

class _AppScopeState extends State<AppScope> {
  late final AppDependenciesNotifier _appDependenciesNotifier;
  late final ThemeModeNotifier _themeModeNotifier;

  @override
  void initState() {
    super.initState();
    _appDependenciesNotifier = AppDependenciesNotifier();
    _themeModeNotifier = ThemeModeNotifier(
      themePersistent:
          widget.initialDependencies.sharedPlatformPersistent,
      savedThemeMode: widget.initialDependencies.savedThemeModeStr,
    );
  }

  @override
  Widget build(final BuildContext context) => ThemeModeProvider(
        themeModeManager: _themeModeNotifier,
        child: AppDependenciesProvider(
          appDependenciesNotifier: _appDependenciesNotifier,
          child: widget.child,
        ),
      );
}
