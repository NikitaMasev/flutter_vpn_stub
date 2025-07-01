import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vpn_wireguard_stub/presentation/flows/pricing_flow/pricing_data.dart';
import 'package:vpn_wireguard_stub/presentation/flows/pricing_flow/pricing_point_info.dart';
import 'package:vpn_wireguard_stub/presentation/flows/pricing_flow/pricing_switcher_view.dart';
import 'package:vpn_wireguard_stub/presentation/widgets/buttons/rounded_button.dart';

const _pricingData = <PricingData>[
  PricingData(
      title: 'Годовой', price: '1990₽ / год', chipInfo: 'Экономия 400₽'),
  PricingData(
    title: 'Mесячный',
    price: '199 ₽ / мес',
  ),
];

class PricingPage extends StatelessWidget {
  const PricingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            children: [
              Text(
                locale.choicePricing,
                style: theme.textTheme.headlineMedium!.copyWith(
                  color: theme.colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              PricingPointInfo(text: locale.pricingFreedom),
              PricingPointInfo(text: locale.pricingInstant),
              PricingPointInfo(text: locale.pricingStable),
              PricingPointInfo(text: locale.pricingSimple),
              PricingPointInfo(
                text: locale.pricingServers,
                bottomSpaceLine: false,
              ),
              const SizedBox(height: 32),
              const Spacer(flex: 5),
              PricingSwitcherView(
                pricingDataList: _pricingData,
                onChanged: (data) {},
              ),
              const Spacer(),
              RoundedButton(
                text: locale.pay,
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
