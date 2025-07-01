import 'package:flutter/services.dart';
import 'package:vpn_wireguard_stub/domain/services_contracts/vpn_permissions.dart';

final class PermissionsHelper implements VpnPermissions {
  PermissionsHelper({required MethodChannel channel}) : _channel = channel;

  final MethodChannel _channel;

  @override
  Future<bool> requestVpnPermission() async {
    try {
      final bool result = await _channel.invokeMethod('requestVpnPermission');
      return result;
    } on PlatformException {
      rethrow;
    }
  }
}
