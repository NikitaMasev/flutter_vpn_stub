import 'dart:async';

class LastInTimeoutStreamTransformer<S> extends StreamTransformerBase<S, S> {
  LastInTimeoutStreamTransformer(this.timeout);

  final Duration timeout;

  @override
  Stream<S> bind(Stream<S> stream) {
    late StreamController<S> controller;
    late StreamSubscription<S> subscription;
    Timer? timer;
    final buffer = <S>[];

    void emitLastData() {
      if (buffer.isNotEmpty) {
        controller.add(buffer.last);
        buffer.clear();
      }
    }

    void onTimerEnd() {
      emitLastData();
      if (!controller.isClosed) {
        timer = Timer(timeout, onTimerEnd);
      }
    }

    void onData(S data) {
      if (timer == null) {
        buffer.add(data);
        timer = Timer(timeout, onTimerEnd);
      } else if (timer!.isActive) {
        buffer.add(data);
      }
    }

    void onDone() {
      timer?.cancel();
      emitLastData();
      controller.close();
    }

    void onError(Object error, StackTrace stackTrace) {
      controller.addError(error, stackTrace);
    }

    controller = StreamController<S>(
      onListen: () {
        subscription = stream.listen(
          onData,
          onError: onError,
          onDone: onDone,
        );
      },
      onCancel: () {
        timer?.cancel();
        subscription.cancel();
      },
    );

    return controller.stream;
  }
}
