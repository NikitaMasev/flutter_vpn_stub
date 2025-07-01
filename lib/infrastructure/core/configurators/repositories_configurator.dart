import 'package:vpn_wireguard_stub/infrastructure/core/models/env_data.dart';

final class RepositoriesConfigurator {
  RepositoriesConfigurator({
    required EnvData envData,
  }) : _envData = envData;

  final EnvData _envData;
}
