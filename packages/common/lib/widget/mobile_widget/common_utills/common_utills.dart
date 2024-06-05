import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CommonUtills {
  static LinearGradient getGradient({required BuildContext context}) {
    final theme = Theme.of(context).monixColors;
    return LinearGradient(
      colors: [
        theme.secondary1,
        theme.secondary2,
      ], // Red to orange (adjust as needed)
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0, 1],
    );
  }
}