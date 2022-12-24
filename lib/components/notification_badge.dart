import 'package:flutter/material.dart';

import '../utils/colors.dart';

class NotificationBadge extends StatelessWidget {
  const NotificationBadge({
    Key? key,
    this.top,
    this.bottom = 1,
    this.left,
    this.right = 3,
  }) : super(key: key);

  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return Positioned(
      bottom: bottom,
      right: right,
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 14,
          minHeight: 14,
        ),
        decoration: BoxDecoration(
          color: colors.background,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
              color: kTileColor,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ),
    );
  }
}
