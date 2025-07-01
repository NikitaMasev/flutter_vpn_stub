
import 'package:vpn_wireguard_stub/domain/models/vpn_state.dart';
import 'package:vpn_wireguard_stub/domain/services_contracts/wireguard_service.dart';
import 'package:vpn_wireguard_stub/infrastructure/services/wireguard/wireguard_settings.dart';
import 'package:wireguard_flutter/wireguard_flutter_platform_interface.dart';

final class WireGuardWrapperService implements WireGuardService {
  WireGuardWrapperService({
    required WireGuardFlutterInterface wireGuard,
    required WireGuardSettings wireGuardSettings,
  })  : _wireGuard = wireGuard,
        _wireGuardSettings = wireGuardSettings;

  final WireGuardFlutterInterface _wireGuard;
  final WireGuardSettings _wireGuardSettings;

  @override
  Future<void> init() => _wireGuard.initialize(
        interfaceName: _wireGuardSettings.interfaceName,
      );

  @override
  Future<void> start() => _wireGuard.startVpn(
        serverAddress: _wireGuardSettings.server,
        wgQuickConfig: _wireGuardSettings.wgConf,
        providerBundleIdentifier: _wireGuardSettings.appPackageId,
      );

  @override
  Future<void> stop() => _wireGuard.stopVpn();

  @override
  Future<bool> isConnected() => _wireGuard.isConnected();

  @override
  Stream<VpnState> stateConnection() => _wireGuard.vpnStageSnapshot.map(
        (stage) => switch (stage) {
          VpnStage.connected => VpnState.connected,
          VpnStage.disconnected => VpnState.disconnected,
          _ => VpnState.other,
        },
      );
}
