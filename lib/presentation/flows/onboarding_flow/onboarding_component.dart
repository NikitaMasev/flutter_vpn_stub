import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vpn_wireguard_stub/domain/persistents_contracts/onboarding_persistent.dart';
import 'package:vpn_wireguard_stub/presentation/flows/onboarding_flow/content_data_builder.dart';
import 'package:vpn_wireguard_stub/presentation/flows/onboarding_flow/onboarding_content.dart';
import 'package:vpn_wireguard_stub/presentation/widgets/anim/animated_dot.dart';
import 'package:vpn_wireguard_stub/presentation/widgets/buttons/rounded_button.dart';

class OnboardingComponent extends StatefulWidget {
  const OnboardingComponent({
    required this.onStartPressed,
    required this.onboardingPersistent,
    super.key,
  });

  final VoidCallback onStartPressed;
  final OnboardingPersistent onboardingPersistent;

  @override
  State<OnboardingComponent> createState() => _OnboardingComponentState();
}

class _OnboardingComponentState extends State<OnboardingComponent> {
  var _activeOnboardingContent = 0;

  void _onPageChanged(int index) {
    _activeOnboardingContent = index;
    setState(() {});
  }

  void onBtnPressed() {
    widget.onboardingPersistent.passed();
    widget.onStartPressed();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Flexible(
          child: RepaintBoundary(
            child: Stack(
              children: [
                PageView.builder(
                  itemCount: onboardingDataCount,
                  onPageChanged: _onPageChanged,
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      const Spacer(flex: 2),
                      OnboardingContent(
                        contentData: contentDataBuilder(
                          context,
                          index,
                        ),
                      ),
                      const Spacer(flex: 3),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Spacer(flex: 9),
                    Flexible(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onboardingDataCount,
                          (index) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: AnimatedDot(
                              key: ValueKey(_activeOnboardingContent),
                              isActive: index == _activeOnboardingContent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 56, right: 56),
          child: Text(
            AppLocalizations.of(context)!.stableNoLimitServersFreedom,
            style: theme.textTheme.displaySmall!.copyWith(
              color: theme.colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 24,
            bottom: 40,
          ),
          child: RoundedButton(
            text: AppLocalizations.of(context)!.starting,
            onPressed: onBtnPressed,
          ),
        ),
      ],
    );
  }
}
