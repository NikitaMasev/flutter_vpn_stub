class WireGuardSettings {
  const WireGuardSettings({
    required this.wgConf,
    required this.server,
    required this.appPackageId,
    required this.interfaceName,
  });

  final String wgConf;
  final String server;
  final String appPackageId;
  final String interfaceName;
}
