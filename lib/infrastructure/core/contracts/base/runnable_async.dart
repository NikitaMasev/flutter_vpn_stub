//ignore_for_file: one_member_abstracts
///TODO Maybe unite with [Configurable]
abstract interface class RunnableAsync {
  Future<void> run();
}
