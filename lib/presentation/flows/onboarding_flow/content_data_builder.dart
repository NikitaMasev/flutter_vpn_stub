import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vpn_wireguard_stub/presentation/assets_paths/assets.gen.dart';
import 'package:vpn_wireguard_stub/presentation/flows/onboarding_flow/content_data.dart';

const onboardingDataCount = 5;

ContentData contentDataBuilder(BuildContext context, int index) =>
    switch (index) {
      0 => ContentData(
          iconWidget: Assets.svg.globus.svg(
            width: 90,
            height: 90,
          ),
          textTitle: AppLocalizations.of(context)!.freedomAccess,
          textSubTitle: AppLocalizations.of(context)!.noBlocking,
        ),
      1 => ContentData(
          iconWidget: Assets.svg.cup.svg(
            width: 90,
            height: 90,
          ),
          textTitle: AppLocalizations.of(context)!.leadersBloggers,
          textSubTitle: AppLocalizations.of(context)!.vpnChoice,
        ),
      2 => ContentData(
          iconWidget: Assets.svg.bolt.svg(
            width: 90,
            height: 90,
          ),
          textTitle: AppLocalizations.of(context)!.highSpeed,
          textSubTitle:
              AppLocalizations.of(context)!.fastAccessPlatformsContent,
        ),
      3 => ContentData(
          iconWidget: Assets.svg.lock.svg(
            width: 90,
            height: 90,
          ),
          textTitle: AppLocalizations.of(context)!.fullAnonymous,
          textSubTitle: AppLocalizations.of(context)!.dataProtected,
        ),
      4 => ContentData(
          iconWidget: Assets.svg.extension.svg(
            width: 90,
            height: 90,
          ),
          textTitle: AppLocalizations.of(context)!.simpleToUse,
          textSubTitle: AppLocalizations.of(context)!.connectByOneTap,
        ),
      _ => ContentData.empty()
    };
