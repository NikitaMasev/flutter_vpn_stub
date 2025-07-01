import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/providers/app_dependencies_provider.dart';

class OnboardingPersistentScope extends StatelessWidget {
  const OnboardingPersistentScope({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) => Provider(
        create: (ctx) => AppDependenciesProvider.of(
          context,
          listen: false,
        ).onboardingPersistent,
        child: child,
      );
}
