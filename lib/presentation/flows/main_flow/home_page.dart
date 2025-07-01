import 'package:flutter/material.dart';
import 'package:vpn_wireguard_stub/di/scopes/permissions_scope.dart';
import 'package:vpn_wireguard_stub/di/scopes/wire_guard_scope.dart';
import 'package:vpn_wireguard_stub/presentation/flows/main_flow/vpn_switch_component.dart';
import 'package:vpn_wireguard_stub/presentation/flows/settings_flow/settings_page.dart';
import 'package:vpn_wireguard_stub/presentation/navigation/routes/nested_transition_route.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: PermissionsScope(
          child: WireGuardScope(
            child: VpnSwitchComponent(
              onSettingsPressed: () => Navigator.of(context).push(
                NestedTransitionRoute(
                  builder: (ctx) => const SettingsPage(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
