abstract interface class ConfigurableAsyncStream<T, S> {
  Future<T> configure();

  Stream<S> state();
}
