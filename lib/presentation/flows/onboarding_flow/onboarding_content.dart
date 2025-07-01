import 'package:flutter/material.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/theming/extensions/extra_theme_extension.dart';
import 'package:vpn_wireguard_stub/presentation/flows/onboarding_flow/content_data.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    required this.contentData,
    super.key,
  });

  final ContentData contentData;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        contentData.iconWidget,
        const SizedBox(height: 24),
        Text(
          contentData.textTitle,
          style: theme.textTheme.displayLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        Text(
          contentData.textSubTitle,
          style: theme.textTheme.displayMedium!.copyWith(
            color: theme.extraColors.colorGray1,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
