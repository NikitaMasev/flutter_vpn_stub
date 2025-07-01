import 'package:vpn_wireguard_stub/infrastructure/core/models/env_data.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/models/environments.dart';

//ignore_for_file: do_not_use_environment
//ignore_for_file: prefer_const_declarations

extension EnvDataParser on EnvData {
  static EnvData fromEnvironment() {
    final env = Env.parse(
      const String.fromEnvironment('ENV', defaultValue: 'test'),
    );

    final host = const String.fromEnvironment(
      'HOST',
      defaultValue: 'test',
    );
    final showLogs = const bool.fromEnvironment('LOGS');

    return EnvData(
      env: env,
      host: host,
      showLogs: showLogs,
    );
  }
}
