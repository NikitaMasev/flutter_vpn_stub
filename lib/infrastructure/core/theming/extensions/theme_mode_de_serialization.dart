import 'package:flutter/material.dart';

extension ThemeModeDeSerialization on ThemeMode {
  ThemeMode deserialize(final String val) => ThemeMode.values.firstWhere(
        (final env) => env.name.split('.').last == val,
        orElse: () => ThemeMode.system,
      );

  String serialize() => name.split('.').last;
}
