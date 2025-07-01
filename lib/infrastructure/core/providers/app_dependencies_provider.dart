import 'package:flutter/material.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/models/app_dependencies.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/notifiers/app_dependencies_notifier.dart';

class AppDependenciesProvider extends InheritedWidget {
  const AppDependenciesProvider({
    required this.appDependenciesNotifier,
    required super.child,
  });

  final AppDependenciesNotifier appDependenciesNotifier;

  @override
  bool updateShouldNotify(covariant final AppDependenciesProvider oldWidget) =>
      false;

  static AppDependenciesProvider provider(
    final BuildContext context, {
    final bool listen = true,
  }) {
    if (listen) {
      final provider =
          context.dependOnInheritedWidgetOfExactType<AppDependenciesProvider>();
      if (provider == null) {
        throw Exception('AppDependenciesProvider not founded!');
      }
      return provider;
    } else {
      final element = context
          .getElementForInheritedWidgetOfExactType<AppDependenciesProvider>();
      if (element == null) {
        throw Exception('AppDependenciesProvider as inherited'
            ' element not founded!');
      }
      return element.widget as AppDependenciesProvider;
    }
  }

  ///Must call after initialization [appDependencies] in splash page
  static void setUp(
    final BuildContext context,
    final AppDependencies appDependencies,
  ) {
    final scope = provider(context);
    scope.appDependenciesNotifier.setUp(appDependencies);
  }

  static AppDependencies of(
    final BuildContext context, {
    final bool listen = true,
  }) {
    final scope = provider(context, listen: listen);

    return scope.appDependenciesNotifier.getAppDependencies;
  }
}
