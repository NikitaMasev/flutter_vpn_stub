import 'package:flutter/material.dart';

class ScrollGlowOff extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      final BuildContext context,
      final Widget child,
      final ScrollableDetails details,
      ) =>
      child;
}
