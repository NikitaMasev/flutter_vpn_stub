import 'package:flutter/material.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/theming/extensions/extra_theme_extension.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    required this.child,
    this.onPressed,
    this.circleShape = false,
    super.key,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final bool circleShape;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bgColors = theme.extraColors.colorGrayDark;
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        elevation: WidgetStateProperty.all(0),
        side: WidgetStateProperty.all(
          BorderSide(
            color: Colors.white.withAlpha(30),
          ),
        ),
        shape: circleShape
            ? WidgetStateProperty.all(const CircleBorder())
            : WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.pressed)) {
            return bgColors.withValues(
              red: 200,
              blue: 200,
              green: 200,
            );
          }
          return null;
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return bgColors.withValues(
              red: 255,
              blue: 255,
              green: 255,
            );
          }
          return bgColors;
        }),
      ),
      child: child,
    );
  }
}
