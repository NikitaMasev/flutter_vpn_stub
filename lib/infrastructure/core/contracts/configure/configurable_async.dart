//ignore_for_file: one_member_abstracts
abstract interface class ConfigurableAsync<T> {
  Future<T> configure();
}
