import 'package:flutter/material.dart';
import 'package:vpn_wireguard_stub/presentation/widgets/buttons/action_button.dart';

class BackCustomButton extends StatelessWidget {
  const BackCustomButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 48,
    height: 48,
    child: ActionButton(
      circleShape: true,
      onPressed: onPressed,
      child: Icon(
        Icons.arrow_back_ios_new_rounded,
        size: 18,
        color: Theme.of(context).colorScheme.primary,
      ),
    ),
  );
}
