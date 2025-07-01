import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/theming/extensions/extra_theme_extension.dart';

class PointMenu extends StatelessWidget {
  const PointMenu({
    required this.text,
    this.bottomLine = false,
    this.onTap,
    super.key,
  });

  final bool bottomLine;
  final VoidCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = AppLocalizations.of(context)!;
    final line = Container(
      width: double.infinity,
      height: 1,
      color: theme.extraColors.colorGrayDark2,
    );
    final styleTextPointMenu = theme.textTheme.bodyLarge!.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.w400,
    );
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            line,
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: styleTextPointMenu,
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                  color: theme.extraColors.colorGray2,
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (bottomLine) line,
          ],
        ),
      ),
    );
  }
}
