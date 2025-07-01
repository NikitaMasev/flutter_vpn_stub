abstract interface class PaymentPersistent {
  Future<void> payed();

  Future<bool> isPayed();
}
