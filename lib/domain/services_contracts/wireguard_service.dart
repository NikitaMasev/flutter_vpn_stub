import 'package:vpn_wireguard_stub/domain/models/vpn_state.dart';

abstract interface class WireGuardService {
  Future<void> init();

  Future<void> start();

  Future<void> stop();

  Future<bool> isConnected();

  Stream<VpnState> stateConnection();
}
