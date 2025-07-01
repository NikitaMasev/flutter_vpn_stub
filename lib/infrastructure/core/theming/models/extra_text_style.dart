import 'package:flutter/material.dart';

class ExtraTextStyle extends ThemeExtension<ExtraTextStyle> {
  ExtraTextStyle({
    required this.textStyleInput,
  });

  final TextStyle textStyleInput;

  @override
  ThemeExtension<ExtraTextStyle> copyWith({
    TextStyle? textStyleInput,
  }) =>
      ExtraTextStyle(
        textStyleInput: textStyleInput ?? this.textStyleInput,
      );

  @override
  ThemeExtension<ExtraTextStyle> lerp(
    covariant ThemeExtension<ExtraTextStyle>? other,
    double t,
  ) {
    if (other is! ExtraTextStyle) {
      return this;
    }

    return ExtraTextStyle(
      textStyleInput: TextStyle.lerp(textStyleInput, other.textStyleInput, t)!,
    );
  }
}
