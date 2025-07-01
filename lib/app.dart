import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/configurators/app/app_dependencies_configurator.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/models/initial_dependencies.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/theming/models/theme_builder.dart';
import 'package:vpn_wireguard_stub/presentation/flows/start_flow/splash_page.dart';

class App extends StatelessWidget {
  const App(this.initialDependencies);

  final InitialDependencies initialDependencies;

  @override
  Widget build(final BuildContext context) => MaterialApp(
        title: 'Wireguard client',
        theme: ThemeBuilder.getDarkTheme(),
        darkTheme: ThemeBuilder.getDarkTheme(),
        themeMode: ThemeMode.dark,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (final ctxHome) => SplashPage(
            appDependenciesConfigurator: AppDependenciesConfigurator(
              envData: initialDependencies.envData,
              sharedPlatformPersistent:
                  initialDependencies.sharedPlatformPersistent,
              appLocalizations: AppLocalizations.of(ctxHome)!,
            ),
          ),
        ),
      );
}
