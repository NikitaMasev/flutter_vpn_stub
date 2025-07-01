import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vpn_wireguard_stub/presentation/widgets/buttons/action_button.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ActionButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          children: [
            Icon(
              Icons.share_outlined,
              size: 24,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Text(
              AppLocalizations.of(context)!.share,
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
