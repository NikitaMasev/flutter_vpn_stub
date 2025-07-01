import 'package:flutter/material.dart';
import 'package:vpn_wireguard_stub/presentation/assets_paths/assets.gen.dart';
import 'package:vpn_wireguard_stub/presentation/widgets/buttons/action_button.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 48,
        height: 48,
        child: ActionButton(
          circleShape: true,
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Assets.svg.setting.svg(
              width: 24,
              height: 24,
            ),
          ),
        ),
      );
}
