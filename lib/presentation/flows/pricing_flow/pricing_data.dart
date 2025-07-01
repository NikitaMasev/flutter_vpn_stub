class PricingData {
  const PricingData({
    required this.title,
    required this.price,
    this.chipInfo,
  });

  final String title;
  final String price;
  final String? chipInfo;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PricingData &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          price == other.price &&
          chipInfo == other.chipInfo;

  @override
  int get hashCode => title.hashCode ^ price.hashCode ^ chipInfo.hashCode;
}
