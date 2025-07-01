import 'package:flutter/material.dart';

class ContentData {
  ContentData({
    required this.iconWidget,
    required this.textTitle,
    required this.textSubTitle,
  });

  factory ContentData.empty() => ContentData(
        iconWidget: const SizedBox.shrink(),
        textTitle: '',
        textSubTitle: '',
      );

  final Widget iconWidget;
  final String textTitle;
  final String textSubTitle;
}
