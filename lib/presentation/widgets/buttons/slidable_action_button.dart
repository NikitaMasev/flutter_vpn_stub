import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vpn_wireguard_stub/infrastructure/core/theming/extensions/extra_theme_extension.dart';

class SlidableActionButton extends StatefulWidget {
  const SlidableActionButton({
    required this.text,
    required this.onSubmit,
    required this.onCancel,
    this.btnHeight = 60,
    this.btnInnerPadding = 8,
    this.durationAnim = const Duration(milliseconds: 150),
    this.forceActiveBtn,
    super.key,
  });

  final String text;
  final VoidCallback onSubmit;
  final VoidCallback onCancel;
  final double btnHeight;
  final double btnInnerPadding;
  final Duration durationAnim;
  final Stream<bool>? forceActiveBtn;

  @override
  State<SlidableActionButton> createState() => _SlidableActionButtonState();
}

class _SlidableActionButtonState extends State<SlidableActionButton>
    with SingleTickerProviderStateMixin {
  var _btnPosition = 0.0;
  var _containerWidth = 0.0;
  late final double _btnSize;

  late AnimationController _animationController;
  late Animation<double> _animation;
  late final StreamSubscription<bool>? _subForceActiveBtn;

  var _btnActive = false;

  @override
  void initState() {
    super.initState();
    _btnSize = widget.btnHeight;
    _animationController = AnimationController(
      vsync: this,
      duration: widget.durationAnim,
    );
    _subForceActiveBtn = widget.forceActiveBtn?.listen((btnActive) {
      _btnActive = btnActive;
      if (btnActive) {
        _animationController.reset();
        _btnPosition = _containerWidth - _btnSize;
      } else {
        _btnPosition = 0;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _subForceActiveBtn?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  void _animBtnToInitialPosition() {
    _animation =
        Tween<double>(begin: _btnPosition, end: 0).animate(_animationController)
          ..addListener(() {
            setState(() {
              _btnPosition = _animation.value;
            });
          });
    _animationController.forward(from: 0);
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    _btnPosition += details.delta.dx;
    if (_btnPosition < 0) {
      _btnPosition = 0;
    } else if (_btnPosition > _containerWidth - _btnSize) {
      _btnPosition = _containerWidth - _btnSize;
    }
    setState(() {});
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    if (_btnPosition > (_containerWidth - _btnSize) * 0.6) {
      _btnPosition = _containerWidth - _btnSize;

      if (!_btnActive) {
        _btnActive = true;
        widget.onSubmit();
      }

      setState(() {});
    } else {
      _animBtnToInitialPosition();

      if (_btnActive) {
        _btnActive = false;
        widget.onCancel();
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bgColorInitial = theme.extraColors.colorGrayDark;
    final bgColorActive = theme.colorScheme.primary;
    final borderColorInitial = theme.colorScheme.primary.withAlpha(30);
    final borderColorActive = theme.colorScheme.primary;
    final btnColorInitial = theme.colorScheme.primary;
    final btnColorActive = theme.extraColors.colorGrayDark;
    final iconColorInitial = theme.extraColors.colorGrayDark;
    final iconColorActive = theme.colorScheme.primary;
    const iconInitial = Icons.arrow_forward;
    const iconActive = Icons.add;

    return LayoutBuilder(
      builder: (context, constraints) {
        _containerWidth = constraints.maxWidth;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          height: _btnSize,
          decoration: BoxDecoration(
            color: _btnActive ? bgColorActive : bgColorInitial,
            borderRadius: BorderRadius.circular(_btnSize / 2),
            border: Border.all(
              color: _btnActive ? borderColorActive : borderColorInitial,
            ),
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Center(
                child: AnimatedDefaultTextStyle(
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color:
                        _btnActive ? Colors.black : theme.colorScheme.primary,
                  ),
                  duration: const Duration(milliseconds: 750),
                  child: Text(widget.text),
                ),
              ),
              Positioned(
                left: _btnPosition,
                child: GestureDetector(
                  onHorizontalDragUpdate: _onHorizontalDragUpdate,
                  onHorizontalDragEnd: _onHorizontalDragEnd,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 350),
                    width: _btnSize - widget.btnInnerPadding,
                    height: _btnSize - widget.btnInnerPadding,
                    margin: EdgeInsets.symmetric(
                      horizontal: widget.btnInnerPadding / 2,
                    ),
                    decoration: BoxDecoration(
                      color: _btnActive ? btnColorActive : btnColorInitial,
                      shape: BoxShape.circle,
                    ),
                    child: _btnActive
                        ? Transform.rotate(
                            angle: 40,
                            child: Icon(
                              iconActive,
                              color: iconColorActive,
                              size: 30,
                            ),
                          )
                        : Icon(
                            iconInitial,
                            color: iconColorInitial,
                            size: 30,
                          ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
