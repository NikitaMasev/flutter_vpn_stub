import 'package:flutter/material.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/theming/extensions/hex_color_converter.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/theming/models/extra_color.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/theming/models/extra_text_style.dart';

sealed class ThemeBuilder {
  static const _colorPrimaryDark = Colors.white;
  static const _colorPrimaryLight = Colors.black;

  static final _colorGray1 = HexColor.fromHex('#838383');
  static final _colorGray2 = HexColor.fromHex('#878787');
  static final _colorGrayDark = HexColor.fromHex('#1C1C1E');
  static final _colorGrayDark2 = HexColor.fromHex('#262626');
  static final _colorLightGreen = HexColor.fromHex('#9FF8CD');
  static final _colorDarkGreen = HexColor.fromHex('#00371D');

  static final _darkTextTheme = TextTheme(
    displayLarge: const TextStyle(
      //USED
      color: _colorPrimaryDark,
      fontSize: 40,
      height: 40 / 40,
      fontWeight: FontWeight.w500,
    ),
    displayMedium: TextStyle(
      //USED
      color: _colorGray1,
      fontSize: 20,
      height: 24 / 20,
      fontWeight: FontWeight.w400,
    ),
    displaySmall: const TextStyle(
      //USED
      color: Colors.white,
      fontSize: 16,
      height: 19.2 / 16,
      fontWeight: FontWeight.w500,
    ),
    headlineLarge: TextStyle(
      //USED
      color: Colors.white,
      fontSize: 20,
      height: 20 / 20,
      fontWeight: FontWeight.w500,
    ),
    headlineMedium: TextStyle(
      //USED
      color: Colors.white,
      fontSize: 24,
      height: 1.0,
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: TextStyle(
      color: Colors.white,
      fontSize: 16,
      height: 12 / 16,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: TextStyle(
      //USED
      color: Colors.white,
      fontSize: 20,
      height: 16 / 20,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      //USED
      color: Colors.black,
      fontSize: 16,
      height: 16 / 16,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      //USED
      color: Colors.white,
      fontSize: 14,
      height: 16 / 14,
      fontWeight: FontWeight.w600,
    ),
    bodySmall: TextStyle(
      //USED
      color: Colors.white,
      fontSize: 14,
      height: 12 / 14,
      fontWeight: FontWeight.w400,
    ),
  );

  static ThemeData getLightTheme() => _theme(
        colorScheme: _lightScheme(),
        textTheme: _darkTextTheme,
        themeExtensions: _getLightExtensions(),
      );

  static ThemeData getDarkTheme() => _theme(
        colorScheme: _darkScheme(),
        textTheme: _darkTextTheme,
        themeExtensions: _getDarkExtensions(),
      );

  static ThemeData _theme({
    required final ColorScheme colorScheme,
    required final TextTheme textTheme,
    required final List<ThemeExtension> themeExtensions,
  }) =>
      ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: colorScheme.primary,
        ),
        popupMenuTheme: PopupMenuThemeData(
          color: colorScheme.surface,
          elevation: 2,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
        extensions: themeExtensions,
      );

  static ColorScheme _lightScheme() => const ColorScheme.light(
        primary: _colorPrimaryLight,
        surface: Color(0xffffffff),
        onSurface: Color(0xff161d1c),
        onSurfaceVariant: Color(0xff3f4947),
      );

  static ColorScheme _darkScheme() => const ColorScheme.dark(
        primary: _colorPrimaryDark,
        surface: Color(0xff000000),
        onSurface: Color(0xffdde4e2),
        onSurfaceVariant: Color(0xffbec9c6),
      );

  static List<ThemeExtension> _getLightExtensions() => [
        ExtraColor(
          colorPrimaryLight: _colorPrimaryLight,
          colorPrimaryDark: _colorPrimaryDark,
          colorGray1: _colorGray1,
          colorGray2: _colorGray2,
          colorGrayDark: _colorGrayDark,
          colorGrayDark2: _colorGrayDark2,
          colorLightGreen: _colorLightGreen,
          colorDarkGreen: _colorDarkGreen,
        ),
        ExtraTextStyle(
          textStyleInput: TextStyle(
            color: _colorGray1,
            fontSize: 24,
            height: 32 / 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ];

  static List<ThemeExtension> _getDarkExtensions() => _getLightExtensions();
}
