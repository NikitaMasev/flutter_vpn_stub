import 'package:shared_preferences/shared_preferences.dart';
import 'package:vpn_wireguard_stub/data/sources/shared/shared_platform_persistent.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/contracts/configure/configurable_async.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/extensions/env_data_parser.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/models/initial_dependencies.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/theming/models/theme_builder.dart';

final class InitialDependenciesConfigurator
    implements ConfigurableAsync<InitialDependencies> {
  @override
  Future<InitialDependencies> configure() async {
    final shared = await SharedPreferences.getInstance();
    final sharedPlatformPersistent = SharedPlatformPersistent(shared: shared);

    final themeModeStr = await sharedPlatformPersistent.getThemeMode();
    final darkTheme = ThemeBuilder.getDarkTheme();
    final lightTheme = ThemeBuilder.getLightTheme();

    final envData = EnvDataParser.fromEnvironment();
    return InitialDependencies(
      sharedPlatformPersistent: sharedPlatformPersistent,
      envData: envData,
      savedThemeModeStr: themeModeStr,
      lightTheme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
