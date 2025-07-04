import 'package:vpn_wireguard_stub/infrastructure/core/contracts/base/configurable.dart';

abstract interface class ConfigurableStateful<T, S> implements Configurable<T> {
  Stream<S> state();
}
