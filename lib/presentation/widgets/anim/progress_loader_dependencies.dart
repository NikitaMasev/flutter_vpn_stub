import 'package:flutter/material.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/configurators/app/app_dependencies_state.dart';
import 'package:vpn_wireguard_stub/presentation/widgets/anim/progress_animation.dart';

class ProgressLoaderDependencies extends StatefulWidget {
  const ProgressLoaderDependencies({
    required this.streamDependencies,
    this.onAnimLoadingEnd,
    super.key,
  });

  final Stream<AppDependenciesState> streamDependencies;
  final VoidCallback? onAnimLoadingEnd;

  @override
  State<ProgressLoaderDependencies> createState() =>
      _ProgressLoaderDependenciesState();
}

class _ProgressLoaderDependenciesState
    extends State<ProgressLoaderDependencies> {
  var _animationProgressIndicator = Tween<double>(
    begin: 0,
    end: 0,
  );

  @override
  Widget build(final BuildContext context) =>
      StreamBuilder<AppDependenciesState>(
        stream: widget.streamDependencies,
        initialData: AppDependenciesInitial(),
        builder: (final ctx, final snap) => switch (snap.data!) {
          AppDependenciesInitial() => ProgressAnimation(
              animationProgressIndicator: _animationProgressIndicator,
            ),
          AppDependenciesLoading(
            progressPercent: final progress,
            description: final msg,
          ) =>
            ProgressAnimation(
              animationProgressIndicator: _animationProgressIndicator = Tween(
                begin: _animationProgressIndicator.end,
                end: progress,
              ),
            ),
          AppDependenciesSuccess() => ProgressAnimation(
              animationProgressIndicator: _animationProgressIndicator = Tween(
                begin: _animationProgressIndicator.end,
                end: 1,
              ),
              onEnd: widget.onAnimLoadingEnd,
            ),
        },
      );
}
