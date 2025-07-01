import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/providers/app_dependencies_provider.dart';
import 'package:vpn_wireguard_stub/presentation/flows/main_flow/home_page.dart';
import 'package:vpn_wireguard_stub/presentation/flows/onboarding_flow/onboarding_component.dart';
import 'package:vpn_wireguard_stub/presentation/flows/pricing_flow/pricing_page.dart';
import 'package:vpn_wireguard_stub/presentation/navigation/routes/home_transition_route.dart';
import 'package:vpn_wireguard_stub/presentation/navigation/routes/nested_transition_route.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    required this.isPayedState,
    super.key,
  });

  final bool isPayedState;

  Future<void> _toHomePage(final BuildContext context) =>
      Navigator.of(context).pushReplacement(
        HomeTransitionRoute(
          child: const HomePage(),
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Builder(
          builder: (ctx) => OnboardingComponent(
            onboardingPersistent:
                AppDependenciesProvider.of(ctx).onboardingPersistent,
            onStartPressed: () async {
              if (isPayedState) {
                unawaited(_toHomePage(ctx));
              } else {
                final payedFromPricing = await Navigator.of(ctx).push(
                      NestedTransitionRoute<bool>(
                        builder: (ctx) => const PricingPage(),
                      ),
                    ) ??
                    false;
                if (payedFromPricing && context.mounted) {
                  unawaited(
                    AppDependenciesProvider.of(ctx)
                        .paymentPersistent
                        .payed(),
                  );
                  unawaited(_toHomePage(ctx));
                }
              }
            },
          ),
        ),
      );
}
