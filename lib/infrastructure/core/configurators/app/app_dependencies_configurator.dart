import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vpn_wireguard_stub/data/sources/shared/shared_platform_persistent.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/configurators/app/app_dependencies_state.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/configurators/data_sources_configurator.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/configurators/repositories_configurator.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/contracts/configure/configurable_async_stream.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/models/app_dependencies.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/models/env_data.dart';
import 'package:vpn_wireguard_stub/infrastructure/services/permissions/permissions_helper.dart';
import 'package:vpn_wireguard_stub/infrastructure/services/wireguard/wireguard_settings.dart';
import 'package:vpn_wireguard_stub/infrastructure/services/wireguard/wireguard_wrapper_service.dart';
import 'package:wireguard_flutter/wireguard_flutter.dart';

final class AppDependenciesConfigurator
    implements ConfigurableAsyncStream<AppDependencies, AppDependenciesState> {
  AppDependenciesConfigurator({
    required final EnvData envData,
    required final SharedPlatformPersistent sharedPlatformPersistent,
    required final AppLocalizations appLocalizations,
  })
      : _envData = envData,
        _sharedPlatformPersistent = sharedPlatformPersistent,
        _appLocalizations = appLocalizations;

  final EnvData _envData;
  final SharedPlatformPersistent _sharedPlatformPersistent;
  final AppLocalizations _appLocalizations;

  final _controllerDependenciesState = StreamController<AppDependenciesState>();

  @override
  Stream<AppDependenciesState> state() => _controllerDependenciesState.stream;

  @override
  Future<AppDependencies> configure() async {
    const defaultDuration = Duration(milliseconds: 100);

    _controllerDependenciesState.add(
      AppDependenciesLoading(
        progressPercent: 0,
        description: _appLocalizations.dependInitFirst,
      ),
    );

    await Future.delayed(defaultDuration);

    _controllerDependenciesState.add(
      AppDependenciesLoading(
        progressPercent: 0.25,
        description: _appLocalizations.dependInitStore,
      ),
    );

    await Future.delayed(defaultDuration);

    _controllerDependenciesState.add(
      AppDependenciesLoading(
        progressPercent: 0.5,
        description: _appLocalizations.dependInitUserRepo,
      ),
    );

    await Future.delayed(defaultDuration);

    final networkClient = DataSourcesConfigurator(
      _envData,
    );

    final reposConfigurator = RepositoriesConfigurator(
      envData: _envData,
    );

    const wgConf = '''
[Interface]
PrivateKey = a;lsjfikNLKNVKLASIOKPFij
Address = 0.0.0.0/12
DNS = 1.1.1.1

[Peer]
PublicKey = ASLFLSLFKaslfl;msal;kgfmapsokjfiopjasfikjsa
PresharedKey = A:KSLfjmkaskfaskmfaskf
AllowedIPs = 0.0.0.0/0, ::/0
PersistentKeepalive = 0
Endpoint = 192.168.1.1:3333
''';

    final appDependencies = AppDependencies(
      envData: _envData,
      wireGuardService: WireGuardWrapperService(
        wireGuard: WireGuardFlutter.instance,
        wireGuardSettings: const WireGuardSettings(
          wgConf: wgConf,
          server: '192.168.1.1:3333',
          appPackageId: 'com.masev.vpn_wireguard_stub',
          interfaceName: 'wg0',
        ),
      ),
      vpnPermissions: PermissionsHelper(
        channel: const MethodChannel(
          'channel_permissions',
        ),
      ),
      paymentPersistent: _sharedPlatformPersistent,
      onboardingPersistent: _sharedPlatformPersistent,
    );

    _controllerDependenciesState..add(
      AppDependenciesLoading(
        progressPercent: 1,
        description: _appLocalizations.dependReady,
      ),
    )..add(
      AppDependenciesSuccess(appDependencies: appDependencies),
    );

    return appDependencies;
  }
}
