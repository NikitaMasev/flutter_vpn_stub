import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    required this.text,
    this.onPressed,
    this.height = 60,
    super.key,
  });

  final VoidCallback? onPressed;
  final double height;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.pressed)) {
              return theme.colorScheme.primary.withValues(
                red: 90,
                blue: 90,
                green: 90,
              );
            }
            return null;
          }),
          backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.disabled)) {
              return theme.colorScheme.primary.withValues(
                red: 180,
                blue: 180,
                green: 180,
              );
            }
            return theme.colorScheme.primary;
          }),
        ),
        child: Text(
          text,
          style: theme.textTheme.bodyLarge!.copyWith(
            color: theme.colorScheme.surface,
          ),
        ),
      ),
    );
  }
}
