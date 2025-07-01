abstract interface class OnboardingPersistent {
  Future<void> passed();

  Future<bool> isPassed();
}
