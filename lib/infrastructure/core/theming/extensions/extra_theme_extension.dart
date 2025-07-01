import 'package:flutter/material.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/theming/models/extra_color.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/theming/models/extra_text_style.dart';

extension ExtraThemeExtension on ThemeData {
  ExtraColor get extraColors => extension<ExtraColor>()!;

  ExtraTextStyle get extraTextStyles => extension<ExtraTextStyle>()!;
}
