import 'package:flutter/material.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/contracts/persistent/theme_persistent.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/theming/extensions/theme_mode_de_serialization.dart';

final class ThemeModeNotifier with ChangeNotifier {
  ThemeModeNotifier({
    required final ThemePersistent themePersistent,
    required final String? savedThemeMode,
  }) : _themePersistent = themePersistent {
    if (savedThemeMode != null) {
      themeMode = ThemeMode.system.deserialize(savedThemeMode);
    } else {
      themeMode = ThemeMode.system;
    }
  }

  final ThemePersistent _themePersistent;
  late ThemeMode themeMode;

  void switchToLight() {
    if (themeMode != ThemeMode.light) {
      themeMode = ThemeMode.light;
      _updateThemeMode();
    }
  }

  void switchToDark() {
    if (themeMode != ThemeMode.dark) {
      themeMode = ThemeMode.dark;
      _updateThemeMode();
    }
  }

  void switchToSystem() {
    if (themeMode != ThemeMode.system) {
      themeMode = ThemeMode.system;
      _updateThemeMode();
    }
  }

  void _updateThemeMode() {
    notifyListeners();
    _themePersistent.saveThemeMode(themeMode.serialize());
  }
}
