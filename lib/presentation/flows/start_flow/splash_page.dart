import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/configurators/app/app_dependencies_state.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/contracts/base/configurable_stateful.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/models/app_dependencies.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/providers/app_dependencies_provider.dart';
import 'package:vpn_wireguard_stub/presentation/flows/main_flow/home_page.dart';
import 'package:vpn_wireguard_stub/presentation/flows/onboarding_flow/onboarding_page.dart';
import 'package:vpn_wireguard_stub/presentation/navigation/routes/nested_transition_route.dart';
import 'package:vpn_wireguard_stub/presentation/widgets/anim/progress_loader_dependencies.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    required this.appDependenciesConfigurator,
    super.key,
  });

  final ConfigurableStateful<AppDependencies, AppDependenciesState>
      appDependenciesConfigurator;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var _dependenciesReady = false;
  late final Widget _nextPage;

  @override
  void initState() {
    super.initState();
    widget.appDependenciesConfigurator
        .configure()
        .then((final appDependencies) async {
      final onboardingPassed =
          await appDependencies.onboardingPersistent.isPassed();
      final isPayedState = await appDependencies.paymentPersistent.isPayed();

      if (onboardingPassed && isPayedState) {
        _nextPage = const HomePage();
      } else {
        _nextPage = OnboardingPage(isPayedState: isPayedState);
      }

      if (mounted) {
        AppDependenciesProvider.setUp(context, appDependencies);
      }
      _dependenciesReady = true;
    });
  }

  void _onAnimLoadingEnd(BuildContext context) {
    if (_dependenciesReady) {
      Navigator.of(context).pushReplacement(
        NestedTransitionRoute(builder: (ctx) => _nextPage),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final sizeContent = MediaQuery.sizeOf(context).width * 0.8;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: theme.colorScheme.surface,
          statusBarIconBrightness: theme.brightness == Brightness.light
              ? Brightness.dark
              : Brightness.light,
          systemNavigationBarIconBrightness:
              theme.brightness == Brightness.light
                  ? Brightness.dark
                  : Brightness.light,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: sizeContent,
                child: ProgressLoaderDependencies(
                  streamDependencies: widget
                      .appDependenciesConfigurator.state(),
                  onAnimLoadingEnd: () => _onAnimLoadingEnd(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
