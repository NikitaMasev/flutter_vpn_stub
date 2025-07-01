import 'package:flutter/material.dart';

class ProgressAnimation extends StatelessWidget {
  const ProgressAnimation({
    required this.animationProgressIndicator,
    this.onEnd,
    super.key,
  });

  final Tween<double> animationProgressIndicator;
  final VoidCallback? onEnd;

  @override
  Widget build(final BuildContext context) => TweenAnimationBuilder(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 150),
        tween: animationProgressIndicator,
        onEnd: onEnd,
        builder: (
          final ctx,
          final val,
          final _,
        ) =>
            ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
          child: LinearProgressIndicator(
            value: val,
            color: Theme.of(context).colorScheme.primary,
            backgroundColor: Theme.of(context).colorScheme.surface,
          ),
        ),
      );
}
