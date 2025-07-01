import 'package:flutter/material.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/theming/extensions/extra_theme_extension.dart';

class AnimatedDot extends StatelessWidget {
  const AnimatedDot({
    required this.isActive,
    super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedContainer(
      duration: const Duration(seconds: 300),
      height: 4,
      width: isActive ? 32 : 4,
      decoration: BoxDecoration(
        color:
            isActive ? theme.colorScheme.primary : theme.extraColors.colorGray1,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    );
  }
}
