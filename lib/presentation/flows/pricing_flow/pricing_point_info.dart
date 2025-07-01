import 'package:flutter/material.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/theming/extensions/extra_theme_extension.dart';

class PricingPointInfo extends StatelessWidget {
  const PricingPointInfo({
    required this.text,
    this.bottomSpaceLine = true,
    super.key,
  });

  final String text;
  final bool bottomSpaceLine;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.headlineSmall!.copyWith(
      color: theme.extraColors.colorGray1,
      height: 1.1,
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ' • ',
          style: style,
          textAlign: TextAlign.left,
        ),
        Flexible(
          child: Text(
            bottomSpaceLine ? '$text\n' : text,
            style: style,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
