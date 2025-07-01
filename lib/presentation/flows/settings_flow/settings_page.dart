import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vpn_wireguard_stub/presentation/flows/settings_flow/header_view.dart';
import 'package:vpn_wireguard_stub/presentation/flows/settings_flow/point_menu.dart';
import 'package:vpn_wireguard_stub/presentation/widgets/buttons/rounded_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const HeaderView(),
              const SizedBox(height: 40),
              PointMenu(
                text: locale.controlSubscription,
                onTap: () {},
              ),
              PointMenu(
                text: locale.writeToSupport,
                onTap: () {},
              ),
              PointMenu(
                text: locale.faq,
                onTap: () {},
              ),
              PointMenu(
                text: locale.politicConfidence,
                onTap: () {},
              ),
              PointMenu(
                text: locale.conditionsUsing,
                onTap: () {},
                bottomLine: true,
              ),
              const SizedBox(height: 64),
              RoundedButton(
                text: AppLocalizations.of(context)!.exit,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
