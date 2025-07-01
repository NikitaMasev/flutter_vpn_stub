import 'package:flutter/material.dart';
import 'package:vpn_wireguard_stub/data/sources/shared/shared_platform_persistent.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/models/env_data.dart';

class InitialDependencies {
  const InitialDependencies({
    required this.sharedPlatformPersistent,
    required this.envData,
    required this.savedThemeModeStr,
    required this.lightTheme,
    required this.darkTheme,
  });

  final SharedPlatformPersistent sharedPlatformPersistent;
  final EnvData envData;
  final String? savedThemeModeStr;
  final ThemeData lightTheme;
  final ThemeData darkTheme;
}
