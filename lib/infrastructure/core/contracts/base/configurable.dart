//ignore_for_file: one_member_abstracts
abstract interface class Configurable<T> {
  Future<T> configure();
}
