import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/theming/extensions/extra_theme_extension.dart';
import 'package:vpn_wireguard_stub/presentation/flows/pricing_flow/pricing_data.dart';

class PricingItemView extends StatelessWidget {
  const PricingItemView({
    required this.isActive,
    required this.data,
    super.key,
  });

  final bool isActive;
  final PricingData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = AppLocalizations.of(context)!;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isActive
              ? theme.colorScheme.primary
              : theme.extraColors.colorGray2,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                data.title,
                style: theme.textTheme.headlineMedium!.copyWith(
                  color: theme.colorScheme.primary,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(width: 12),
              if (data.chipInfo != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: theme.extraColors.colorLightGreen,
                  ),
                  child: Text(
                    data.chipInfo!,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: theme.extraColors.colorDarkGreen,
                    ),
                  ),
                ),
              const Spacer(),
              Stack(
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: isActive ? 1.0 : 0.0,
                    child: const Icon(
                      Icons.check_circle,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: isActive ? 0.0 : 1.0,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: theme.extraColors.colorGray2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            locale.pricingItemPaymentInfo,
            style: theme.textTheme.bodySmall!.copyWith(
              color: theme.extraColors.colorGray1,
              height: 1.1,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              data.price,
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
