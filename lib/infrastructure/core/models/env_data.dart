import 'package:vpn_wireguard_stub/infrastructure/core/models/environments.dart';

final class EnvData {
  const EnvData({
    required this.env,
    required this.host,
    required this.showLogs,
  });

  final Env env;
  final String host;
  final bool showLogs;
}
