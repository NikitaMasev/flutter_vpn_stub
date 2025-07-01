import 'package:shared_preferences/shared_preferences.dart';
import 'package:vpn_wireguard_stub/domain/persistents_contracts/onboarding_persistent.dart';
import 'package:vpn_wireguard_stub/domain/persistents_contracts/payment_persistent.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/contracts/persistent/theme_persistent.dart';

enum _Keys {
  theme,
  onboarding,
  payment,
}

class SharedPlatformPersistent
    implements ThemePersistent, OnboardingPersistent, PaymentPersistent {
  SharedPlatformPersistent({
    required SharedPreferences shared,
  }) : _shared = shared;

  final SharedPreferences _shared;

  @override
  Future<String?> getThemeMode() async => _shared.getString(_Keys.theme.name);

  @override
  Future<void> saveThemeMode(final String themeMode) =>
      _shared.setString(_Keys.theme.name, themeMode);

  @override
  Future<bool> isPassed() async =>
      _shared.getBool(_Keys.onboarding.name) ?? false;

  @override
  Future<void> passed() => _shared.setBool(_Keys.onboarding.name, true);

  @override
  Future<bool> isPayed() async => _shared.getBool(_Keys.payment.name) ?? false;

  @override
  Future<void> payed() => _shared.setBool(_Keys.payment.name, true);
}
