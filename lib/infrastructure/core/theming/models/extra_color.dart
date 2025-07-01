import 'package:flutter/material.dart';

class ExtraColor extends ThemeExtension<ExtraColor> {
  ExtraColor({
    required this.colorPrimaryLight,
    required this.colorPrimaryDark,
    required this.colorGray1,
    required this.colorGray2,
    required this.colorGrayDark,
    required this.colorGrayDark2,
    required this.colorLightGreen,
    required this.colorDarkGreen,
  });

  final Color colorPrimaryLight;
  final Color colorPrimaryDark;
  final Color colorGray1;
  final Color colorGray2;
  final Color colorGrayDark;
  final Color colorGrayDark2;
  final Color colorLightGreen;
  final Color colorDarkGreen;

  @override
  ThemeExtension<ExtraColor> copyWith({
    Color? colorPrimaryLight,
    Color? colorPrimaryDark,
    Color? colorGray1,
    Color? colorGray2,
    Color? colorGrayDark,
    Color? colorGrayDark2,
    Color? colorLightGreen,
    Color? colorDarkGreen,
  }) =>
      ExtraColor(
        colorPrimaryLight: colorPrimaryLight ?? this.colorPrimaryLight,
        colorPrimaryDark: colorPrimaryDark ?? this.colorPrimaryDark,
        colorGray1: colorGray1 ?? this.colorGray1,
        colorGray2: colorGray2 ?? this.colorGray2,
        colorGrayDark: colorGrayDark ?? this.colorGrayDark,
        colorGrayDark2: colorGrayDark2 ?? this.colorGrayDark2,
        colorLightGreen: colorLightGreen ?? this.colorLightGreen,
        colorDarkGreen: colorDarkGreen ?? this.colorDarkGreen,
      );

  @override
  ThemeExtension<ExtraColor> lerp(
    covariant final ThemeExtension<ExtraColor>? other,
    final double t,
  ) {
    if (other is! ExtraColor) {
      return this;
    }
    return ExtraColor(
      colorPrimaryLight:
          Color.lerp(colorPrimaryLight, other.colorPrimaryLight, t)!,
      colorPrimaryDark:
          Color.lerp(colorPrimaryDark, other.colorPrimaryDark, t)!,
      colorGray1: Color.lerp(colorGray1, other.colorGray1, t)!,
      colorGray2: Color.lerp(colorGray2, other.colorGray2, t)!,
      colorGrayDark: Color.lerp(colorGrayDark, other.colorGrayDark, t)!,
      colorGrayDark2: Color.lerp(colorGrayDark2, other.colorGrayDark2, t)!,
      colorLightGreen: Color.lerp(colorLightGreen, other.colorLightGreen, t)!,
      colorDarkGreen: Color.lerp(colorDarkGreen, other.colorDarkGreen, t)!,
    );
  }
}
