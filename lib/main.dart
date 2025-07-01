import 'dart:async';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:vpn_wireguard_stub/app.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/configurators/initial/initial_dependencies_configurator.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/scopes/app_scope.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/typedefs/app_builder.dart';

void main() => _bootstrap(
      (final platformDependencies) => AppScope(
        initialDependencies: platformDependencies,
        child: App(
          platformDependencies,
        ),
      ),
    );

Future<void> _bootstrap(
  final AppBuilder builder,
) async {
  runZonedGuarded<void>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      final initialDependencies =
          await InitialDependenciesConfigurator().configure();

      //Bloc.observer = TalkerBlocObserver(talker: talker);
      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      );
      runApp(builder(initialDependencies));
    },
    (final error, final stack) async {
      log('$error \n $stack');
    },
  );

  FlutterError.onError = (final details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
}
