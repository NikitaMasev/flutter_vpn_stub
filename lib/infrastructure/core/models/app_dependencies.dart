import 'package:vpn_wireguard_stub/domain/persistents_contracts/onboarding_persistent.dart';
import 'package:vpn_wireguard_stub/domain/persistents_contracts/payment_persistent.dart';
import 'package:vpn_wireguard_stub/domain/services_contracts/vpn_permissions.dart';
import 'package:vpn_wireguard_stub/domain/services_contracts/wireguard_service.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/models/env_data.dart';

final class AppDependencies {
  AppDependencies({
    required this.envData,
    required this.wireGuardService,
    required this.vpnPermissions,
    required this.paymentPersistent,
    required this.onboardingPersistent,
  });

  final EnvData envData;
  final WireGuardService wireGuardService;
  final VpnPermissions vpnPermissions;
  final PaymentPersistent paymentPersistent;
  final OnboardingPersistent onboardingPersistent;
}
