import 'package:flutter/material.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/models/app_dependencies.dart';

final class AppDependenciesNotifier with ChangeNotifier {
  AppDependencies? _appDependencies;

  AppDependencies get getAppDependencies {
    if (_appDependencies == null) {
      throw Exception('AppDependencies not initialized!');
    }
    return _appDependencies!;
  }

  ///Must call after initialization [appDependencies] in splash page
  void setUp(final AppDependencies appDependencies) {
    if (_appDependencies != null) {
      throw Exception('AppDependencies already initialized!');
    }
    _appDependencies = appDependencies;
    notifyListeners();
  }
}
