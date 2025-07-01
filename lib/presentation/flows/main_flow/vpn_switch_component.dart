import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:vpn_wireguard_stub/domain/models/vpn_state.dart';
import 'package:vpn_wireguard_stub/domain/services_contracts/vpn_permissions.dart';
import 'package:vpn_wireguard_stub/domain/services_contracts/wireguard_service.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/theming/extensions/extra_theme_extension.dart';
import 'package:vpn_wireguard_stub/presentation/assets_paths/assets.gen.dart';
import 'package:vpn_wireguard_stub/presentation/widgets/buttons/settings_button.dart';
import 'package:vpn_wireguard_stub/presentation/widgets/buttons/share_button.dart';
import 'package:vpn_wireguard_stub/presentation/widgets/buttons/slidable_action_button.dart';

class VpnSwitchComponent extends StatefulWidget {
  const VpnSwitchComponent({
    required this.onSettingsPressed,
    super.key,
  });

  final VoidCallback onSettingsPressed;

  @override
  State<VpnSwitchComponent> createState() => _VpnSwitchComponentState();
}

class _VpnSwitchComponentState extends State<VpnSwitchComponent>
    with TickerProviderStateMixin {
  late final VpnPermissions _permissionsInterface;
  late final WireGuardService _wgService;
  var _vpnActive = false;
  var _speedometerInitial = true;
  late AnimationController _animOnSpeedometerController;
  late AnimationController _animOffSpeedometerController;
  late final StreamSubscription<VpnState> _subVpnState;

  @override
  void initState() {
    super.initState();
    _animOnSpeedometerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animOffSpeedometerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _permissionsInterface = context.read<VpnPermissions>();
    _wgService = context.read<WireGuardService>();
    _subVpnState = _wgService.stateConnection().listen((state) {
      _vpnActive = state == VpnState.connected;
      setState(() {});
    });
  }

  Future<void> _connectToVpn() async {
    /*   if (Platform.isAndroid) {
      final granted = await _permissionsInterface.requestVpnPermission();
      if (granted) {
        await _wgService.init();
        await _wgService.start();
        _vpnActive = await _wgService.isConnected();
      }
    }*/
    _vpnActive = true;
  }

  Future<void> _disconnectFromVpn() async {
/*    await _wgService.stop();
    _vpnActive = await _wgService.isConnected();*/
    _vpnActive = false;
  }

  Future<void> _onBtnPressed() async {
    if (_vpnActive) {
      await _vpnOffFlow();
    } else {
      await _vpnOnFlow();
    }
  }

  Future<void> _vpnOnFlow() async {
    if (_animOffSpeedometerController.isAnimating) {
      return;
    }
    _animOffSpeedometerController.reset();

    await Future.wait([
      _animOnSpeedometerController.forward(),
      _connectToVpn(),
    ]);

    if (!_vpnActive) {
      _animOnSpeedometerController.reset();
    }
    _speedometerInitial = false;
    setState(() {});
  }

  Future<void> _vpnOffFlow() async {
    if (_animOnSpeedometerController.isAnimating) {
      return;
    }
    _animOnSpeedometerController.reset();

    await Future.wait([
      _animOffSpeedometerController.forward(),
      _disconnectFromVpn(),
    ]);
    _speedometerInitial = true;
    setState(() {});
  }

  @override
  void dispose() {
    _animOnSpeedometerController.dispose();
    _subVpnState.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = AppLocalizations.of(context)!;
    return Column(
      children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShareButton(onPressed: () {}),
              SettingsButton(onPressed: widget.onSettingsPressed),
            ],
          ),
        ),
        const Spacer(flex: 3),
        const SizedBox(height: 60),
        Text(
          _vpnActive ? locale.vpnOn : locale.vpnOff,
          style: theme.textTheme.headlineLarge!.copyWith(
            color: theme.extraColors.colorGray1,
          ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              overlayColor: const WidgetStatePropertyAll(Colors.transparent),
              onTap: _onBtnPressed,
              child: Stack(
                children: [
                  Opacity(
                    opacity: _speedometerInitial ? 1.0 : 0.0,
                    child: Lottie.asset(
                      Assets.anim.onButton002New2.path,
                      controller: _animOnSpeedometerController,
                      repeat: false,
                      alignment: Alignment.center,
                    ),
                  ),
                  Opacity(
                    opacity: _speedometerInitial ? 0.0 : 1.0,
                    child: Lottie.asset(
                      Assets.anim.offButton002New2.path,
                      controller: _animOffSpeedometerController,
                      repeat: false,
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Spacer(flex: 3),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: SlidableActionButton(
            text: locale.autopilot,
            onSubmit: () {},
            onCancel: () {},
          ),
        ),
        const Spacer(),
        Text(
          'До конца тестового\nпериода осталось 2д.4ч.',
          style: theme.textTheme.bodyLarge!.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
