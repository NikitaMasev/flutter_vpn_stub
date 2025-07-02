import 'dart:ui';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with
  /// an optional leading "#".
  static Color fromHex(final String hex) {
    final cleaned = hex.replaceFirst('#', '');
    final argb = cleaned.length == 6 ? 'ff$cleaned' : cleaned;
    return Color(int.parse(argb, radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true`
  /// (default is `true`).
  String toHex({bool leadingHashSign = true}) {
    int f8(double c) => (c * 255).round() & 0xff; // float->8-бит
    final a8 = f8(a);
    final r8 = f8(r);
    final g8 = f8(g);
    final b8 = f8(b);
    final hex =
        (a8 << 24 | r8 << 16 | g8 << 8 | b8).toRadixString(16).padLeft(8, '0');
    return leadingHashSign ? '#$hex' : hex;
  }
}
